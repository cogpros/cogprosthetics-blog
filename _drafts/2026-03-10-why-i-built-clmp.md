---
layout: post
title: "Why I Built CLMP"
date: 2026-03-10
categories: [infrastructure, tbi, cogpros, aicp]
description: "The memory pipeline that closes the loop my brain can't. And why I'm giving it away."
---

It's Tuesday morning and I know exactly what to do.

That sentence means nothing to most people. For me it's the whole point.

In February 2016 I sustained a traumatic brain injury. Among a lot of other things, it disrupted my ability to hold threads. Not intelligence. Threading. The kind of passive background processing most people do without thinking about it: what happened yesterday, what connects to what, what to pick up next. That infrastructure got damaged.

For years I managed through brute force and workarounds. Notebooks. Alarms. Asking people to repeat things. Starting fresh every morning because I couldn't remember where yesterday left off. Not forgetting the day entirely. Losing the connective tissue between days. Monday's work wouldn't inform Tuesday's decisions because the thread wasn't held anywhere.

The bad mornings were the worst part. Not bad because something went wrong. Bad because I'd sit down and have no idea what to do next. The information was somewhere. In a note, in a file, in a conversation I had but couldn't place. Scattered across surfaces with no one collecting it.

That's the gap CLMP closes.

## What CLMP Is

CLMP stands for Closed-Loop Memory Pipeline. Three stages, fully automated, runs every night.

**Stage 1: Assembly.** A script runs at 10:45 PM and collects everything from my day. Work sessions, voice memos, agent output, task board state, content board state, system health. All of it gets assembled into one markdown file: `memory/YYYY-MM-DD.md`.

**Stage 2: Synthesis.** At 11:00 PM, an AI model reads that file and does what my brain used to do on its own. It finds connections between things I worked on. It catches threads I mentioned but didn't track. It identifies what got closer to done and what's stuck. It writes down what I should start with tomorrow based on where today's momentum was pointing.

**Stage 3: Morning Brief.** At 7:30 AM, another pass reads last night's synthesis and compiles a quick briefing. Coffee-reading length. When I pick up my phone in the morning, I know what happened yesterday, what matters today, and where to start.

The loop:

```
[Daily work] → [Assembly] → [Synthesis] → [Morning Brief] → [Next day's work]
```

Every night the loop closes. Every morning it opens again with context intact. The thread that TBI broke, CLMP rebuilt in software.

## Why It Matters

Here's what people miss about memory problems after brain injury. It's not like forgetting your keys. It's like having a desktop where files rearrange themselves overnight. You know you put something somewhere. You know it was important. But the spatial relationship between things has shifted and you're navigating a room you were in yesterday that doesn't quite look the same today.

Before CLMP, my agents were smart but amnesiac. They could do incredible work in a single session. But the next session started cold. The context from yesterday was gone unless I manually reconstructed it. And reconstructing context with a brain that struggles to hold context is exactly the kind of circular problem that makes you want to throw your laptop.  Or grab your printer cause its closer and smash it on the floor. Oops.

CLMP means I never reconstruct context manually. The system does it. Automatically. Every night. Without me touching anything.

The synthesis layer is the part that changed everything. Assembly alone would be useful. A daily log, organized and readable. But synthesis does what I used to be able to do before the injury: it looks at all the pieces and tells me what connects. It catches the thing I said in one context that matters in another context. It notices that two projects are converging before I do.

That's not a chatbot trick. That's a cognitive prosthetic performing a function my brain lost.

## What It Looks Like in Practice

Here's what a real synthesis catches that I would miss:

I'm working on three things. A blog post, a script for automating task board updates, and a voice memo system for capturing thoughts on the go. In my head, these are three separate workstreams. I context-switch between them during the day and by 10 PM I've moved pieces on all three boards but I don't see the picture.

The synthesis sees it. The voice memo system feeds routed thoughts into the assembly. The task board script is what the assembly reads. The blog post is about the system that does all of this. They're not three workstreams. They're one pipeline. The synthesis writes that down. In the morning I read it and go: yeah, that's right. That's where this is going.

I didn't see it. The system did. And it handed it back to me in a format my brain can work with.

## The Architecture (Brief)

I'm not going to walk through every line of code here. I wrote a full architecture document and I've shared it with a few friends. But the design decisions matter.

**Marker-based assembly.** The script wraps auto-generated content in HTML markers: `<!-- CLMP:START v=1 -->` and `<!-- CLMP:END -->`. This means the script can re-run without destroying anything I wrote manually in the same file. Human content is protected. Machine content is replaceable. This sounds like a small thing. It's not. When your memory system can't be trusted to preserve what you wrote, you stop writing in it.

**Four-state guard logic.** Before the script writes anything, it checks: does the file exist? Does it have markers? Does it have human content? Based on those answers it either creates new, replaces the machine section, or leaves it alone. No data loss. Ever. When your memory is already unreliable, your memory system cannot be.

**Restricted file permissions.** Memory files contain real context about real work. They're created with 0o600 permissions. Owner only. Because cognitive prosthetics hold the same kind of information a brain holds, and brains aren't world-readable.

**Strong model for synthesis.** I use Opus for the nightly synthesis. It costs about a dollar a run. That's not nothing. But using a weaker model produces generic summaries that tell you what you already know. The whole point is catching the non-obvious. The thing you mentioned at 2 PM that connects to the thing you did at 9 AM. A strong model catches that. A weak model summarizes your task list and calls it insight.

## Giving It Away

Matt and Maverick want CLMP. He's been watching what I'm building and he asked for it.

There's something that happens when you build a system to solve a problem that's deeply personal and someone else says: I need that too. It validates the work in a way that internal metrics can't. Ghost Hours can tell me how much time the system saves. FW-C scores can tell me how significant a session felt. But another human saying "give me that" tells me the problem is real and the solution works.

Matt doesn't need CLMP for the same reason I do. But the problem CLMP solves isn't exclusive to brain injury. Anyone running AI agents, managing multiple projects, or working across contexts has the same gap at smaller scale. The day generates signal. Nobody collects it. It evaporates overnight. You start tomorrow slightly dumber than you ended today.

CLMP catches it before it does.

So I wrote up the architecture. Not my scripts, not my config. The blueprint. What it does, how the pieces connect, what you need to wire on your end. Maverick's a big boy. He'll make it his own.

And that's kind of the point of all of this. The cognitive prosthetics work I'm doing isn't supposed to stay mine. The system I built for a brain injury turns out to be useful for any brain. The gap between what you experienced and what you remember experiencing is universal. TBI just made mine wider. Wide enough that I had to build something to bridge it.

## What This Is Really About

I've been calling this work AICP. AI-based Cognitive Prosthetics. It's a framework I'm developing for understanding what happens when AI doesn't just assist you but extends you. When it performs cognitive functions that you either lost or never had.

CLMP is one prosthetic in the system. It handles memory threading. Other pieces handle different functions. Together they form something I needed a word for. What happens when the system works. When it stops being "me and my tools" and starts being one thing thinking together. I started calling it the hugr: the hybrid mind that emerges when a human and their AI agents operate as a single cognitive unit.

The thing about prosthetics is they're not supposed to be custom one-offs. They're supposed to be reproducible. If this only works for me, it's a coping mechanism. If it works for Matt, and for whoever comes after Matt, it's a tool.

That's what I'm building toward.

---

*The full CLMP architecture document is available on request. If you're building something similar, reach out: [@pyra_m1d](https://x.com/pyra_m1d)*
