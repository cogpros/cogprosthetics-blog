---
layout: post
title: "The Phantom Benchmark"
date: 2026-04-07
categories: [cogpros, research, memory]
description: "I built a 401-question memory retrieval benchmark. 25% of the questions were impossible to answer, and the BM25 numbers were fake. Two phantoms, one benchmark."
---

i built a benchmark to test how well AI memory retrieval actually works. 401 questions against 678 real memory files. not synthetic data. my actual cognitive prosthetic memory: session logs, rules, project states, system manifest entries.

the first results looked bad. architecture questions scored 28%. cross-reference questions scored 22%. i thought i'd found a fundamental gap: embeddings fail on structured metadata. short documents. component registries. the kind of memory a cognitive prosthetic needs most.

i was wrong. 70% of those questions were impossible to answer.

## the phantom bug

the benchmark generator randomly sampled 50 manifest entries out of 222 for the test corpus. then it generated questions about all 222. the questions about the 172 entries that weren't in the corpus scored zero. always. regardless of retriever quality.

worse: the generator created a phantom answer ID for each missing entry instead of flagging it. so the scoring function thought the answer existed. it just couldn't find it. the benchmark was measuring a data pipeline bug and reporting it as retrieval failure.

25% of all questions were phantoms. for architecture and cross-reference categories, it was 70-77%.

if you're building memory benchmarks: verify that every answer actually exists in the retrieval corpus before you score anything. phantom answers are easy to create and hard to detect. we lost weeks chasing a "structural retrieval gap" that was a data generation bug.

## what the clean numbers show

i fixed the generator and ran three retriever configurations on the clean data.

| retriever | R@1 | R@5 | R@10 | speed |
|-----------|-----|-----|------|-------|
| chromadb + graph expansion (MiniLM-L6-v2) | 63% | 84% | 90% | 0.03s |
| qmd vsearch (GemmaEmbed 300M) | 67% | 84% | 88% | 4.84s |
| qmd query (GemmaEmbed + Qwen 0.6B rerank) | 62% | 89% | 93% | 14.8s |

per-category breakdown (R@10):

| category | chromadb+expansion | qmd vsearch | qmd query |
|----------|-------------------|-------------|-----------|
| architecture (56) | 98% | 98% | 100% |
| cross-reference (80) | 98% | 98% | 98% |
| rule-recall (91) | 91% | 89% | 95% |
| preference-feedback (70) | 86% | 86% | 93% |
| project-state (100) | 83% | 75% | 84% |
| temporal (4) | 25% | 75% | 75% |

the story inverted. architecture and cross-reference are the easiest categories. those 128-character manifest entries ("Name: agent-main, Type: agent, Portability: portable") are actually perfect for embedding search: short, distinctive, unique keywords.

the hard category is project-state. "what is the current state of X?" against 5000-character session logs where the answer is one paragraph buried in narrative.

an earlier version of this analysis included BM25 keyword search as a separate retriever. those numbers were wrong. qmd's BM25 engine returns zero results for natural-language queries ("What is the rule about clipboard first?" returns nothing; "clipboard" works fine). the "complementary retriever" story built on BM25 + embedding fusion was built on phantom data. it was the second phantom in this benchmark, caught only when we demanded per-question hit/miss logging instead of trusting aggregate numbers.

## the reranker earns its cost

the gap between raw embedding search and reranked search is +5 points at R@10. the reranker lifts preference-feedback from 86% to 93%, rule-recall from 89% to 95%, project-state from 75% to 84%. these are the categories a cognitive prosthetic hits hardest: "what's the rule about X?" and "what's the state of Y?"

the cost is real: 14.8 seconds per query vs 4.8 seconds for raw search. 3x slower. but 5 points on the questions that matter most is worth 10 extra seconds.

graph expansion is the cheap alternative. adding one-hop neighbors from a pre-computed similarity graph costs ~0ms overhead and lifts ChromaDB from raw to 90% R@10. a weaker embedding model (MiniLM) with graph expansion beats a stronger model (GemmaEmbed) without it.

all three configs converge at R@50 around 96%. the ceiling is the same. what differs is how fast you get there. for a prosthetic that serves answers in real-time, the R@5 gap matters more than R@50: the reranker hits 89% at R@5 while raw search sits at 84%.

## document length is the strongest predictor

| answer doc length | R@10 | miss rate |
|-------------------|------|-----------|
| under 500 chars | 98.2% | 1.8% |
| 500 to 1500 | 89.3% | 10.7% |
| 1500 to 3000 | 78.4% | 21.6% |
| over 3000 chars | 60.0% | 40.0% |

documents over 3000 characters fail 40% of the time. under 500, they fail 1.8%. the embedding gets diluted by content density. a 128-char manifest entry is a tight semantic vector. a 5000-char session log is a blurred average of everything discussed that day.

source type tells the same story. session logs miss 40%. content files miss 27%. manifest entries miss 2.2%.

## chunking makes it worse

the obvious fix for long documents is chunking: split them into 800-character pieces, embed each piece separately. it's the standard approach. MemPalace does it. most RAG pipelines do it.

on this data, it doesn't work.

| doc length | raw R@10 | chunked R@10 | delta |
|------------|----------|-------------|-------|
| under 500 | 98.2% | 97.0% | -1.2 |
| 500 to 1500 | 89.3% | 83.4% | -5.9 |
| 1500 to 3000 | 78.4% | 81.1% | +2.7 |
| over 3000 | 60.0% | 66.7% | +6.7 |
| **overall** | **89.8%** | **87.5%** | **-2.2** |

chunking helps the long documents (+6.7 pts on 3000+ chars) but destroys medium documents (-5.9 pts on 500-1500). overall it's a net loss. splitting a 1000-char feedback file into two chunks loses the context that made the document distinctive: the title, the topic sentence, the frontmatter.

the conventional wisdom is "chunk your docs for better retrieval." on real personal memory files, that wisdom is wrong. chunking helps at the extremes but the damage to medium-length documents outweighs the gains.

the right approach is probably hierarchical: embed both the full document and its chunks, search both, deduplicate. or chunk only documents over a threshold and prepend the document title to every chunk so embeddings don't lose context. both are experiments for another day.

## the three failure modes

29 questions miss at R@10 on the best retriever config (qmd query). they cluster into three patterns.

**semantic near-collisions (14 misses).** the retriever finds the right neighborhood but picks the wrong neighbor. "what is the rule about timescale language accuracy?" returns `timezone-display` instead of `timescale-language`. both live in the same semantic space. the correct answer ranked #15.

**dense document burial (16 misses).** the answer is one paragraph inside a 5000-char document. the document's embedding represents all its content, not the one paragraph that answers the question. daily session logs and synthesis documents are the worst offenders. the correct answer doesn't appear in the top 50.

**temporal confusion (3 misses).** "which came first: synthesis 2026-03-30 or 2026-03-31?" embeddings can't distinguish dates. the retriever returns synthesis_2026-03-03 instead. embeddings encode semantics, not temporal ordering.

## 13 questions nothing can answer

13 out of 401 questions fail across all retrievers. chromadb, qmd vsearch, qmd query. none of them get within the top 10.

6 are project-state questions about specific dates ("what is the current state of 2026-03-03?"). the answer is a 5000-char session log. dozens of other session logs have similar content. nothing distinguishes them to a retriever.

4 are preference and rule questions where the topic name is semantically ambiguous. "never blame navigation" could be about UI navigation, wayfinding, or the actual rule (which is about not blaming the user for following your bad directions).

2 are temporal ordering questions. embeddings have no concept of "before" and "after."

1 is a cross-reference question where the component name ("resonance") is also a common english word used across many documents.

these 13 questions need either metadata-aware retrieval (filtering by date, type, or name before embedding search) or passage-level indexing (embedding paragraphs, not documents). they're the ceiling for pure retrieval without structural metadata.

## what to invest in

if you're building memory retrieval and have to choose: add a reranker before upgrading the embedding model. the reranker takes a mediocre ranked list and fixes it. a better embedding model makes a slightly better ranked list that still needs fixing.

graph expansion is free and effective. if you have any notion of document similarity (even just embedding nearest-neighbors), use it. the one-hop expansion pattern adds ~2 points for zero latency cost.

chunking is a trap for memory files. the next section explains why.

## what this means for cognitive prosthetics

the 7% that current retrievers miss is concentrated in operational memory. "what's the state of this project?" "what's the preference about that workflow?" the questions a cognitive prosthetic gets asked every day.

the fix isn't better embeddings or smarter reranking. it's structural. the reason project-state questions fail is that session logs are long, dense, and semantically similar to each other. the reason preference questions fail is that feedback files cover overlapping topics with similar language.

the path forward is making documents more distinctive before they enter the retrieval pipeline. better titles. clearer topic sentences. metadata that retrieval can filter on before embedding search runs. the palace architecture that MemPalace builds (wings, halls, rooms) is one approach to this. structured frontmatter is another.

the retrieval itself is already good enough. what needs work is the memory architecture underneath it.

## the data

401 questions across 6 categories. 678 corpus documents from a real cognitive prosthetic memory system. three retriever configurations tested on clean v3 data with verified per-question hit/miss logging. all runs on Apple M4, no cloud APIs. the only LLM call in the pipeline is qmd's optional Qwen 0.6B reranker.

benchmark code at [cogpros/mempalace](https://github.com/cogpros/mempalace).
