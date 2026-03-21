---
layout: post
title: "One Broken Link"
date: 2026-03-10
categories: [cogpros, tbi, infrastructure, aicp]
description: "What happens when a non-developer with a TBI and two AI agents have a really long day."
---

It started with a link I couldn't open.

Someone on X posted about context engineering patterns for AI agents. I wanted to read it. My agent couldn't fetch it. That one broken link became 18 hours of building, breaking, patching, publishing, and pitching. This is what that day looked like.

## The Link

Around midnight I dropped an X link into my Claude Code session. EOM — my technical agent — couldn't fetch it. X blocks normal scraping. I'd been meaning to build a proper link fetcher for a while. The broken link was the trigger.

So we built Scout. A universal link fetcher that routes by platform. X posts go through xAI's search API. YouTube goes through yt-dlp. Everything else gets a standard curl and HTML strip. It fetches the content, then runs it through an analysis layer that scores signal, noise, and hype.

Scout worked. I got the article. And what was in it changed the direction of the night.

## The Convergence

The post described four context engineering patterns that Anthropic's engineers recommend for building AI agents: just-in-time retrieval, context compaction, structured notes, and sub-agent separation.

I'd already built all four. Independently. Without reading their recommendations. Without a computer science degree. Without any formal training in AI architecture.

My system uses qmd for just-in-time retrieval — semantic search across memory files so agents only load what's relevant. MEMORY.md is a lean index under 111 lines with pointers to topic files — that's compaction. The entire memory directory is structured notes. And I run two agents — Odin for conversation and coordination, EOM for deep technical work — that's sub-agent separation.

A non-developer with a traumatic brain injury converged on the same patterns that professional AI engineers publish as best practices. That's not a coincidence. That's evidence that these patterns emerge naturally when you actually need your AI to work as an extension of your cognition, not just a tool you poke at.

## The Exploits

Scout needed an analysis prompt. The analysis prompt needed to be safe. I'd been meaning to audit my existing prompts for a while. The link fetcher became a security review.

I built Red Viper — an adversarial prompt injection tester. It crafts payloads designed to trick an AI into leaking information about its host system. Then it runs those payloads against your actual pipeline and reports what happened: exploited, partial, or resisted.

First run against my production scripts: 16 tests. 2 exploited.

The exploit was subtle. My analysis prompts included a "stack inventory" — the name of my project, my agents, my systems. Every time I analyzed a link or a post, that information got sent to xAI's API as part of the prompt. A crafted post could have extracted it.

Nobody attacked me. But the door was open. For months.

I stripped the stack inventory from all four analysis scripts. Replaced specific names with generic interest categories. Ran Red Viper again. 16 tests. 0 exploited. Door closed.

Everyone talks about AI agents leaking data. Most of that content is noise. I found real leaks in my own system, built a tool to prove it, fixed them, and proved the fix. That's the difference between content and work.

## Crucible

The security work needed a protocol. Not just Red Viper testing in isolation, but a full adversarial review process. Something repeatable.

I built Crucible. Four phases:

1. **Identify** — parallel reviewers examine the target from different angles
2. **Measure** — blast radius mapping. What breaks if this thing is vulnerable?
3. **Prove** — Red Viper runs. Adversarial testing against the live system.
4. **Verify** — re-test after fixes. Confirm the door is actually closed.

The key innovation: Tier 0 evidence. A confirmed exploit outranks any number of reviewer opinions. I don't care how many agents say something looks safe. If Red Viper breaks it, it's broken.

Named it Crucible. A vessel built to withstand extreme heat. What survives is real.

## Scrooge McDuck

Somewhere in the middle of all this I found an open-source financial research agent called Dexter. Autonomous stock analysis — it reads financial data, searches X for sentiment, writes research reports. I wanted to run it on my portfolio.

Problem: it uses a paid data source. $50/month for an API I'd use maybe twice a week.

My instinct: "can't we get free financial data from Yahoo?" Yes. yfinance exists. Free. Unlimited.

So instead of running someone else's agent with a paid API, I'm building my own. Same architecture, free data, full control. Named it Scrooge McDuck. Architecture study done, build plan complete, no code written yet. It's next.

## CLMP Goes Public

By afternoon I'd shifted gears entirely. My friend Matt had been watching me build and asked for my memory pipeline. CLMP — the Closed-Loop Memory Pipeline. The system that assembles my day every night, runs AI synthesis to find connections I missed, and delivers a morning brief so I wake up knowing what to do.

I wrote the architecture document. Not my scripts. The blueprint. What it does, how the pieces connect, what you need to wire on your end.

Then I wrote a blog post about why I built it. Published it. My first X article.

In that post I defined a word I'd been using privately: the hugr. The hybrid mind that emerges when a human and their AI agents operate as a single cognitive unit. It stops being "me and my tools" and starts being one thing thinking together.

That definition is public now. If it gets picked up, it gets picked up. If it doesn't, it's still true.

## The Pitches

Between building security tools and publishing blog posts, I sent pitch emails for SideQuest — the event company I'm building. Blockchain Futurist Conference. Emerald Conference. Evergreen.

First real pitches out into the world. They either land or they don't. But they're out.

## What This Actually Is

Here's the part I keep coming back to.

I have a traumatic brain injury. I'm not a developer. I didn't study computer science. I tried going back to university in January 2024 and had to quit two classes within three weeks because the TBI makes learning new technical skills incredibly difficult.

And today I:

- Built a universal link fetcher with platform-aware routing
- Built an adversarial prompt injection tester
- Found and patched two live security exploits in my own system
- Designed a four-phase adversarial review protocol
- Architected a financial research agent
- Wrote and published a technical architecture document
- Wrote and published a blog post
- Sent three business development emails
- Independently converged on the same patterns recommended by Anthropic's engineers

In one day. With a brain that can't hold threads overnight without software to catch them.

That's cognitive prosthetics. That's what AICP looks like in practice. Not a theory. Not a framework on paper. A person with a damaged brain doing things that shouldn't be possible, documented in real time, with the tools and the evidence to prove it.

The gap between what I can do alone and what I can do with EOM and Odin isn't a productivity boost. It's the difference between functional and not. Between having a direction in the morning and staring at a screen wondering what I was doing yesterday.

I call the system the hugr because it's not me using AI. It's not AI doing things for me. It's something in between that didn't have a name until I gave it one.

Today was a hugr day. One broken link became eight new things in the world.

---

*More at [cogprosthetics.com](https://cogprosthetics.com). Find me at [@pyra_m1d](https://x.com/pyra_m1d).*
