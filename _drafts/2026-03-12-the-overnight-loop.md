---
layout: post
title: "The Overnight Loop"
date: 2026-03-12
categories: [cogpros, infrastructure, agents, aicp]
description: "I built a system that lets my AI agent iterate on problems while I sleep. Then I watched it optimize my own morning brief in five passes."
---

I wrote yesterday about running Crucible against my autoresearch system and catching a naming bug that would have silently killed every iteration. Today I fixed the last piece and ran it.

Five iterations. No human in the loop. Each one building on the last.

## What autoresearch is

A bash script that orchestrates a research loop through my agent queue. It reads a config file that defines a goal, evaluation criteria, and a stop condition. Then it generates a handoff, drops it in the queue, waits for my agent to finish, reads the response, and decides whether to loop again or stop.

The pieces: an orchestrator script, a handoff template, and a config file per loop. The config says what to optimize and how to evaluate each iteration. The template tells the agent it's in a loop and gives it the rules. The orchestrator handles sequencing, budget tracking, and state.

No framework. No orchestration library. Bash, markdown files, and a file watcher I already had running.

## The first real run

I pointed it at my morning brief. The brief runs at 9:09am every day via cron. It reads the previous day's synthesis and produces a Telegram message with focus items, reminders, and context. I've been using it for weeks. It works. But I skip half of it most mornings because there's too much noise.

The config defined four evaluation criteria: clarity (scannable in 30 seconds), actionability (every item has a next step), signal-to-noise (nothing I'd skip), and format (big picture first).

Five iterations. Here's what the loop did on its own:

**Iteration 1:** Restructured the brief from six flat sections into two tiers. "DO TODAY" above the line, context below. Added a hard cap: 12 lines max. Every action item must end with a verb phrase. No more "Sellper landing page." Now it's "Sellper landing page -- finalize copy and push to staging."

**Iteration 2:** Found a strategic context file that was bolted on as a separate section. Absorbed the actionable parts into DO TODAY, killed the rest. Emoji headers gone. Dashboard metrics gone. Follow-ups routed directly into the action tier.

**Iteration 3:** Added a priority ranking for the 12-line cap. When all seven data sources fire, what gets cut first? Informational items and already-moving tasks drop. Blocked items and people follow-ups are protected. No more judgment calls at 9am about what matters. The system decides ahead of time.

**Iteration 4:** Noticed the verb-phrase rule existed in the instructions but the template still used abstract placeholders. Added concrete examples directly into the format block so the cron author can't miss the pattern.

**Iteration 5** was running when I started writing this.

## What happened

Each iteration read the previous one's results, identified the weakest remaining criterion, made exactly one change, evaluated it, and reported. No iteration undid a previous one. No iteration tried to do two things at once. The one-change-per-iteration rule held.

The system optimized itself. The morning brief I'll get tomorrow was refined by five passes of focused evaluation against criteria I defined once.

## Why this matters for cogpros

I have a traumatic brain injury. My working memory drops threads overnight. The morning brief exists because I need something to tell me where I am and what to do next. Without it, I stare at a screen.

But I also couldn't sit down and run five focused optimization passes on the brief format myself. The cognitive load of holding the evaluation criteria, the current state, the previous changes, and the improvement target across five iterations is exactly the kind of sustained working memory task that my injury makes difficult.

So I described what "better" looks like. The system did the optimization work. And it did it while I was writing a blog post about the review process that made the loop possible in the first place.

That's the pattern. I set the direction. The system does the grinding. I review the output. The things I'm good at -- knowing what matters, setting criteria, seeing the big picture -- stay mine. The things my injury makes hard -- sustained iteration, detail tracking, holding state across passes -- get handled by the infrastructure.

This is what cognitive prosthetics looks like when the infrastructure is deep enough. Not an agent doing a task. A system that improves itself based on criteria I set, without me holding every thread.

## The stack

For people who want to build something similar:

- **Orchestrator:** 400 lines of bash. Generates handoffs, polls for responses, tracks state, handles budget and timeouts.
- **Template:** A markdown file with variable substitution. Tells the agent it's in a loop, gives it the rules, shows previous results.
- **Config:** Frontmatter for settings (max iterations, budget, poll interval). Body for the goal and evaluation criteria.
- **Queue:** The same file-based handoff system I published in the OpenClaw Playbook. No new infrastructure needed.
- **Safety:** PID locks prevent concurrent runs. SHA-256 sidecars verify file integrity. Fail-safe defaults (silence means stop). Budget caps at the watcher level.

The whole thing runs on a Mac Mini. No cloud. No API orchestration. No framework dependencies.

If you want the playbook, it's on the site.

---

*More at [cogprosthetics.com](https://cogprosthetics.com). Find me at [@pyra_m1d](https://x.com/pyra_m1d).*
