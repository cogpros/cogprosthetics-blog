---
layout: post
title: "The Filing Cabinet Problem"
date: 2026-04-08
categories: [cogpros, memory, architecture]
description: "Everyone building a second brain hits the same wall. The moment you add structured data, it collapses into a CRM. Here's why, and what actually fixes it."
---

Drew Austin posted a question today that stopped my scroll.

He built and sold a company in agentic recruiting. He has ADHD. He's been life-logging for years, recording Zoom conversations, waiting for the tech to catch up. Now he's trying to build what he calls "a Perplexity for my world." A personal knowledge network built from conversations, interactions, content consumption, activities, relationships, and thoughts.

His problem: the moment he imports structured data (people, companies, deals), CRM creep takes over. The knowledge network starts feeling like a database.

His open question: how do you structure a personal knowledge system that holds rich entity data without collapsing into a filing cabinet?

I've been building exactly this system for two months. Not as theory. As infrastructure I depend on daily. And I hit the same wall he's describing before I found what actually works.

## why filing cabinets happen

the thread under Drew's post had four levels of answer.

one person said: convert everything to markdown, point Claude Code at it, add backlinks and embedding search. this is correct tooling advice. it's also a recipe for a well-organized filing cabinet. backlinks create a graph, but a graph without decay is just a database with lines drawn between rows.

another said: signal over database. the intelligence layer houses signal, not data aggregation. closer. but "signal" without a mechanism to surface it is just a priority label on a filing cabinet drawer.

a third wrote: "let entities breathe, let context flow, let retrieval feel like conversation." that's the felt experience of the thing that works. but it doesn't tell you how to build it.

a fourth is building "Rumi," an AI chief of staff for his VC firm. 1,215-line operating handbook. CRM in Airtable. Call transcripts, email access, calendar integration. impressive setup. and then he wrote this: "There was too much information. Too many tasks, too many contacts, too many relationships to hold in a single document or keep in working memory." his answer was to spin up an Airtable database. that's CRM creep happening in real time, documented in a blog post. the filing cabinet just got nicer furniture.

the filing cabinet happens because of one architectural mistake: treating all information at the same depth. every fact, every contact, every note gets the same persistence, the same visibility, the same weight. a database does this by design. so does Obsidian with 10,000 backlinked notes. so does an Airtable with every action item from every call transcript. equal depth is what makes retrieval feel like digging through a filing cabinet instead of thinking.

## karpathy took us halfway there

Drew referenced Karpathy's model in his post. worth looking at what it does and where it stops.

Karpathy built an LLM knowledge base that compiles raw research material into a self-maintaining wiki. dump files into a folder. the LLM writes articles, creates backlinks, runs health checks for consistency, and maintains the whole thing autonomously. 100 articles, 400,000 words, zero manual writing. it's a knowledge compiler.

it's good. the compilation step is real. having an LLM maintain structure, backlinks, and consistency across hundreds of files is a genuine advance over doing it by hand.

but it's still a wiki. it doesn't forget. it doesn't speak first. it compiles and organizes, which means it gets bigger over time, which means it becomes a filing cabinet with really good indexing. the wiki doesn't know what matters to you right now. it treats the article you wrote six months ago and the one from this morning with equal weight.

Karpathy also built autoresearch: an autonomous loop that modifies code, verifies against a metric, keeps what works, reverts what doesn't. brilliant for mechanical targets. I took that pattern and built variants on top of it for debugging, security audits, documentation, shipping, scenario generation, and more. but the most important extension was this: I added a second axis.

Karpathy's loop optimizes forward. it makes things better by a measurable metric. but optimization has a drift problem. the loop can improve your writing's defensibility while quietly eroding your voice. it can make your code more efficient while breaking the design intent. the metric gets better. the thing gets worse.

the fix: two axes, not one. axis one checks defensibility (does it pass scrutiny?). axis two checks truth (is this still mine?). a revision isn't done until both axes pass. that's what prevents optimization drift, the slow replacement of signal with noise that happens when you let a system iterate without checking what it's iterating away from.

## graphs, not backlinks

the thread said "create backlinks between files, this creates a graph." it doesn't. it creates a web of text references. backlinks are bidirectional pointers with no type, no direction, no weight. they tell you two things mention each other. they don't tell you how, or why, or what breaks if one changes.

a knowledge graph has typed relationships. CALLS, IMPORTS, DEPENDS_ON, MEMBER_OF, STEP_IN_PROCESS. the edge between two nodes carries meaning, not just proximity. that's the difference between "these two files mention the same word" and "this function calls that function, which imports this module, which is step three in this execution flow."

I have a code intelligence graph tracking thousands of symbols across five repositories with eleven relationship types. when I ask "what breaks if I change this function?" it doesn't search for the function name. it walks the graph upstream: direct callers, indirect dependencies, execution flows that pass through that node. it returns a blast radius with confidence levels at each depth. that's not retrieval. that's structural understanding.

on the knowledge side, a compilation pipeline assembles daily logs, session debriefs, and project states into topical wiki pages. a graph builder extracts cross-references between those pages with context sentences on every edge: not just "A links to B" but "A links to B because this sentence mentions B in the context of a design decision." 227 topics, force-directed layout, interactive visualization. the graph shows clusters forming around domains that I didn't explicitly organize. the structure emerges from the relationships, not from the folder hierarchy.

a unified search layer indexes both agents' memory pools. when two AI agents coordinate through a shared knowledge bus, the bus has a librarian that classifies, deduplicates, and promotes findings into the wiki layer. cross-references are stored as typed metadata. the related field in every file is a pointer to other files that matter, not a backlink that happened to match a keyword.

Karpathy's wiki compiler creates backlinks. that's valuable. but a backlink says "these two topics are connected." a typed knowledge graph says "this topic depends on that topic through this specific relationship, and here are the three execution flows that pass through both." one tells you things are related. the other tells you what happens when things change.

Drew's CRM creep problem is partly a graph problem. contacts, companies, and deals aren't just entities to store. they're nodes in a network of relationships: who introduced who, which deal connects to which company, which conversation led to which commitment. if you store them in rows, you get a database. if you store them as nodes with typed edges, you get a map you can actually navigate.

## what actually fixes the filing cabinet

four layers. three with different half-lives, one with different connectivity.

**layer 1: active index.** short. under 200 lines. rules, constraints, active project pointers. what shapes every session. this layer decays. completed items drop. stale items get flagged at 30 days. the index is a relevance filter, not a record. if everything is important, nothing is.

**layer 2: detail files + knowledge graph.** persistent. searchable. 356 files in my system right now, each with typed metadata (project, feedback, reference, user). these never decay. they're the long-term memory. but they don't load into active context unless something pulls them forward. a semantic search tool indexes all of them with hybrid keyword and vector retrieval. and underneath, a graph layer maps how they connect: typed relationships, cross-references with context, execution flows that trace how things actually work together. you search when you need depth. the graph tells you what connects to what.

**layer 3: awareness.** pattern recognition triggers that fire contextually. when I share a URL, the system fetches and scans it automatically. when I'm about to edit code without reading it, the system says "want to read that first?" when momentum stalls and direction is unclear, it says "break it down?" when a multi-file change has no plan, it says "spec first?" this layer doesn't store anything. it watches and speaks first.

**layer 4: graph intelligence.** this is the structural layer. it doesn't just store files or surface triggers. it understands how things connect and what changes propagate. when I change a function, the code graph shows me every caller, every dependent, every flow that touches it. when a wiki topic updates, the knowledge graph shows what other topics reference it and might need revision. this is what prevents Drew's CRM creep: entities aren't stored in rows. they're nodes in a navigable network where relationships are first-class, not derived.

the four layers solve Drew's problem because entity data lives in layer 2, relationships live in layer 4, and neither pollutes layer 1 unless something makes it relevant right now. layer 3 is what makes the system feel alive instead of dead. it doesn't wait for you to search. it taps you when something matters.

Rumi doesn't have this separation. everything lives at the same depth: the operating handbook, the CRM, the call transcripts, the action items. when everything is always loaded, you're carrying the whole filing cabinet into every conversation.

## decay is the feature nobody builds

every second brain tool I've seen treats persistence as the goal. save everything. never lose anything. index it all.

that's the filing cabinet. that's exactly what a filing cabinet is. a system that never forgets.

a living knowledge system forgets on purpose. my active index was 215 lines and 34KB three weeks ago. I compressed it to 197 lines and 18KB. not because information was lost. the detail files still exist. the search tool still finds them. but the active layer got lighter, and the system got faster.

there's a write gate that enforces this. every new entry in the index must be under 150 characters, must point to a detail file, must be checked for duplicates, and must carry no payload. the index is a table of contents, not a notebook. density is enforced at write time, not cleaned up later.

this is starting to show up in the research. new memory frameworks are experimenting with confidence decay, where stored memories lose weight over time unless reinforced. the Ebbinghaus forgetting curve applied to AI memory. but most production systems still treat persistence as the default. the conversation about intentional forgetting is just beginning.

CRMs never do this. they accumulate. that's the product design: more data, more value. but for a personal knowledge system, more data without decay is more noise. the filing cabinet fills up and the signal drowns.

## anticipation is the feature nobody builds either

search is not enough. Drew said he wants "better retrieval." the thread said "add embedding search." but retrieval is reactive. you have to know you need something, formulate a question, search, scan results, extract the answer.

a system that works as a cognitive extension doesn't wait for you to search. it watches the work happening and surfaces what matters before you ask.

I have three autonomous processes running in my system right now:

**memory pulse** fires every 45 minutes during a session. it checks what I said I'd do against what I've done. if I set an intention and drifted, it taps me. one line. not a notification wall. a tap on the wrist.

**sentry** fires after every completed action. it verifies the output actually landed. file exists? non-empty? matches the instruction? catches silent failures that would otherwise go unnoticed until something downstream breaks.

**proprioception** monitors system health across five domains. cron failures, stale data, stuck queues. it auto-repairs what it can and escalates what it can't. the system watching itself so I don't have to.

on top of those, a daily debrief runs two AI agents through three rounds of Q&A plus a synthesis pass, alternating who leads each day. a morning nudge scans that output for intentions I set but haven't acted on. an ingestion layer extracts durable knowledge from daily logs and writes it into the memory system while I sleep. 22 scheduled automations running before I wake up.

none of these are search. none of these are retrieval. they're anticipation. the system noticing things I haven't noticed yet and surfacing them at the right moment in the right context.

Drew's "Perplexity for my world" is a search metaphor. search is half the answer. the other half is a system that speaks first.

## what the benchmarks show

I didn't just build this system. I tested it. 401 questions against 678 real memory files. not synthetic data. my actual cognitive prosthetic memory: session logs, rules, project states, system configurations. six question types covering architecture, cross-reference, rule recall, preference feedback, project state, and temporal queries.

some of the common advice is wrong.

**chunking hurts.** splitting documents into overlapping chunks at 700 tokens dropped retrieval by 4.5 points. for medium-length memory files (500-3000 characters), chunking fragments the context that makes retrieval work. the whole document is the unit of meaning.

**compression destroys retrieval.** AAAK, the compression format from Milla Jovovich and Ben Sigman's MemPalace project, dropped R@10 by 18 points on my data, from 89.8% to 71.8%. they've acknowledged a 12-point regression in their own benchmarks (84.2% vs 96.6% raw). AAAK works on verbose conversational text. on already-dense structured files, it actively hurts. if someone tells you to compress your memory files for efficiency, test it on your actual data first.

**system prompt in queries is a silent killer.** prepending 2000 characters of system context to a query dropped R@10 from 89.8% to 1.0%. the embedding represents the system prompt, not your question. the retrieval returns results with no errors. they're just wrong. any architecture that concatenates context and query before embedding search will fail silently.

**keyword search is dead for natural language.** BM25 returns zero results for questions phrased as humans actually ask them. "what is the rule about clipboard first?" returns nothing. the word "clipboard" works fine. the previous numbers suggesting keyword search was complementary were built on phantom benchmark data.

**reranking is the best investment.** a small reranker model adds 5 points at R@10 for a 3x latency cost. it lifts the hardest categories (rule recall, project state) the most. the questions a cognitive prosthetic needs to answer best are exactly the ones where reranking helps most.

**document length is the #1 predictor of difficulty.** files under 500 characters: 98.8% retrieval. files over 3000 characters: 76.7%. short, distinctive files are easy to find. long narrative files where the answer is buried in one paragraph are hard. the architecture of your memory files matters more than the search algorithm.

the thread said "add embedding search." that's the starting point, not the answer. the retrieval layer needs to be tested against your actual data, not assumed to work because the API returned results.

## the scale of the thing

this isn't a weekend project with a markdown folder.

34 skills built and running. 128 scripts. 23 named cognitive primitives, 18 validated through independence testing. a code intelligence system tracking thousands of symbols across multiple repositories. adversarial review pipelines where independent specialist agents stress-test outputs before they ship. a measurement framework tracking every session. 22 scheduled automations. two AI agents with distinct cognitive roles coordinated through a shared knowledge layer.

I say this not to flex. I say it because every piece exists because the simpler version failed. the three-layer memory exists because a flat file system became unusable at 200 files. the write gate exists because the index bloated to 34KB and started losing entries past line 200. the anticipation primitives exist because I kept forgetting to check things I told myself I'd check. every piece of infrastructure was built in response to a real failure, not in anticipation of a theoretical one.

the system is a scar map. every feature marks where something broke.

## the four questions

if you're building a personal knowledge system and it's starting to feel like a filing cabinet, ask four questions:

**does it forget?** if nothing ever leaves the active layer, you're building a database. decay is not data loss. it's attention management. detail persists in the deep layer. the active layer stays light.

**does it speak first?** if you have to search every time, you're doing the system's job. the system should watch, pattern-match, and surface. not replace your judgment. just tap you when something matters.

**does it understand connections?** if your entities are stored in rows, you have a database. if they're nodes with typed edges, you have a map. a filing cabinet knows what it contains. a knowledge graph knows how things relate, what depends on what, and what changes when something moves. backlinks are the starting point. typed relationships are the destination.

**does it have layers?** if every piece of information lives at the same depth with the same visibility, you have a filing cabinet with a search bar. separate the index from the detail from the graph from the awareness. different half-lives. different connectivity. different purposes.

Drew asked how to keep it feeling like a living network instead of a filing cabinet.

the answer: build a system that forgets, speaks first, maps real relationships, and separates what's hot from what's cold. the filing cabinet stores everything equally. the living system knows what matters right now and how it connects to everything else.
