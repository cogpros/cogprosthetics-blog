---
layout: post
title: "The Agent Trap"
date: 2026-03-08
categories: [agents, infrastructure]
description: "I had 5 AI agents. I deleted 3 of them. Two agents with solid infrastructure will outperform ten agents with none."
---

I had 5 AI agents. Huginn, Muninn, Bragi, Allfiler, and the two that actually do things.

I named them after Norse mythology because of course I did.

Huginn and Muninn were supposed to be my memory ravens. One watches, one remembers. Beautiful concept. Never ran once.

Bragi was going to handle creative work. Allfiler was going to sort and organize everything automatically.

None of them ever processed a single task.

Meanwhile my two actual agents (Odin and EOM) were doing all the work. Every day. Reliably. Because I built the infrastructure around them first. Handoff queues. Cron jobs. Memory files. Routing.

So I deleted the other four.

## The instinct is wrong

Here's what I learned: the instinct when you start building with AI agents is to add more of them. Got a new problem? New agent. Need something automated? New agent. It feels productive. You're scaling.

You're not scaling. You're accumulating.

Every agent you add is another thing that needs context, needs instructions, needs monitoring, needs budget. And if you haven't built the pipes for the agents you already have, adding more just means more things sitting idle.

## What infrastructure actually looks like

The two agents that work have this behind them:

**Handoff queues.** A folder where one agent drops a task file and the other picks it up. No API. No orchestration framework. Markdown files in a directory, processed oldest first, with a lock timeout so nothing gets stuck.

**Cron jobs.** Scheduled work that runs whether I'm awake or not. Daily memory assembly at 10:45pm. Morning brief at 7:30am. Crew monitoring every 12 hours. The agents don't decide when to work. The clock does.

**Memory files.** Persistent context that survives between sessions. What happened yesterday. What's blocked. What the priorities are. Without this, every session starts from zero and the agent has to be re-taught the world.

**Routing.** A deterministic router that handles keyword-matched messages without touching an LLM. Simple pattern matching. No tokens burned on "switch to max" or "check the queue." The router handles it and the agent never wakes up.

None of this is glamorous. None of it would make a good demo. All of it is why two agents can do what five couldn't.

## The rule

Two agents with solid infrastructure will outperform ten agents with none.

Build the plumbing first. The agents come after.
