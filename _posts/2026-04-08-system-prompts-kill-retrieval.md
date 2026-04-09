---
layout: post
title: "System Prompts Silently Kill Embedding Retrieval"
date: 2026-04-08
categories: [cogpros, memory, benchmarks]
description: "Prepending system prompt context to embedding queries drops retrieval from 89.8% to 1.0%. No errors. No warnings. Just wrong results. Tested on two models. The mechanism is universal."
---

I've been benchmarking [MemPalace](https://github.com/milla-jovovich/mempalace). Not the LongMemEval headline number. The actual retrieval pipeline, on real memory data, with real questions.

The headline finding: prepending system prompt context to embedding queries drops retrieval from 89.8% to 1.0%. No errors. No warnings. The search returns results. They're just wrong.

## The setup

401 questions. 6 types (architecture, cross-reference, rule-recall, preference-feedback, project-state, temporal). 678 corpus documents. `all-MiniLM-L6-v2` embeddings in ChromaDB. Same setup MemPalace uses.

I ran every configuration I could think of. Expansion, type filtering, chunking, AAAK compression, keyword fusion, rerankers. Then I ran one more: prepend 2000 characters of system prompt to each query before embedding.

## The results

| Config | R@10 |
|--------|------|
| GemmaEmbed + Qwen reranker | 92.8% |
| ChromaDB + type filter | 91.0% |
| ChromaDB + expansion | 89.8% |
| Keyword overlap fusion | 89.8% |
| GemmaEmbed raw | 87.8% |
| Chunking (700/2100) | 85.3% |
| AAAK compression | 71.8% |
| System prompt prepended | 1.0% |
| BM25 | ~2% |

That last line is not a typo. 89.8% to 1.0%. Every question type collapses. Architecture questions go from 98.2% to 0.0%.

## Why

It's simple once you see it. The embedding model takes the full input string and produces one vector. If 2000 characters of system prompt sit in front of a 30-character question, the vector represents the system prompt. ChromaDB faithfully returns the nearest neighbors to your system prompt. Not your question.

I proved it directly with cosine similarity. Take one question. Embed it clean. Embed the system prompt alone. Embed them concatenated:

```
cosine(clean_question, dirty_question)  = 0.4059
cosine(system_prompt,  dirty_question)  = 1.0000
```

The concatenated vector is identical to the system prompt vector. The question is gone. Not degraded. Gone.

The cliff is steep. Here's the degradation curve averaged over 5 questions:

| Prepend chars | cos(question, dirty) | cos(sysprompt, dirty) |
|---------------|---------------------|-----------------------|
| 0 (control) | 1.0000 | n/a |
| 100 | 0.6250 | 0.7684 |
| 250 | 0.5705 | 0.8088 |
| 500 | 0.5210 | 0.8802 |
| 1000 | 0.1404 | 1.0000 |
| 2000+ | 0.1404 | 1.0000 |

At 1000 chars the question is completely erased. At 500 chars the system prompt already dominates. MiniLM has a 256-token context window. Once the system prompt fills that window, the question literally cannot fit. It gets truncated before the model even sees it.

The failure is silent. The search returns results. The similarity scores look normal (they're just comparing system-prompt-shaped vectors to each other). Nothing errors. Nothing warns. Your memory system just stops working.

## Why this matters beyond MemPalace

MemPalace tells users to inject `mempalace wake-up` output into their system prompt. But the problem is bigger than that.

Any MCP integration where the server receives the full conversation context alongside the user's question is vulnerable. If the tool concatenates context and query before embedding search, retrieval fails. This affects every RAG system that doesn't explicitly isolate the query before searching.

The mechanism is context window overflow. MiniLM has a 256-token window. Once the prepended text fills that window, the question gets truncated before the model sees it.

I tested a second model to confirm. Nomic embed-text has an 8192-token window. 32x larger. The cliff is gentler but the destination is the same:

| Prepend chars | MiniLM cos(clean,dirty) | Nomic cos(clean,dirty) |
|---------------|------------------------|----------------------|
| 500 | 0.5210 | 0.6827 |
| 1000 | 0.1404 | 0.5898 |
| 2000 | 0.1404 | 0.5488 |
| 5000 | 0.1404 | 0.5048 |

MiniLM hits the wall at 1000 chars. Nomic degrades slower, but at 5000 chars the system prompt is 99.87% of the signal. The question is effectively gone. A larger context window buys you runway. It doesn't buy you immunity.

Two models, two architectures, two context windows, same result. I'd like to see the curves for OpenAI, Cohere, and Voyage embeddings. The reproduction is five lines of code. My prediction: every model breaks. The question is where.

## Other findings

A reranker (GemmaEmbed + Qwen 2.5 0.5B) hit 92.8% R@10. Best result across all configs. Worth the latency cost (14.8s vs 0.03s per query).

AAAK compression drops retrieval by 18 points (89.8% to 71.8%). This lines up with what BEAM found in their evaluation. Lossy compression of memory documents destroys the embedding signal.

Chunking hurts. Splitting documents at 700 chars fragments the context that embeddings need. BM25 is dead on natural language queries.

Document length is the strongest predictor of retrieval failure. Short documents (under 500 chars) retrieve at 98.8%. Long documents (over 3000 chars) drop to 76.7%. If you want better retrieval, make your documents shorter.

## The fix

Query isolation. The embedding query must contain only the question. System prompt, conversation history, tool descriptions: all of it needs to be stripped before the query hits the embedding model. This isn't a tuning problem. It's a design constraint.

I've [filed this as an issue](https://github.com/milla-jovovich/mempalace/issues/333) on the MemPalace repo with full reproduction steps.

## Methodology note

This benchmark runs against my own memory corpus, not a synthetic dataset. The absolute numbers are corpus-specific. The system prompt finding is not. The mechanism (embedding vector overwhelmed by prepended context) is universal to any embedding model and any vector database. You can reproduce it with your own data using the scripts linked in the GitHub issue.
