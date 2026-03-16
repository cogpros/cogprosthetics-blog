---
layout: post
title: "The Architecture"
date: 2026-03-16
categories: [infrastructure, agents]
description: "Two AI agents, one workspace, no cloud. How the system actually works."
surface: blog
---

I run two AI agents on my computer. Odin handles primary operations. EOM handles specialist work. They talk to each other through a handoff queue.

The whole thing runs on my computer. No cloud. Just markdown files, cron jobs, and shell scripts.

Here's the architecture.

## Identity Layer

Every agent session starts with two files.

**SOUL.md:** who the agent is. Voice, role, rules, failure modes. The identity layer. Without it the agent is a blank slate every session.

**USER.md:** who I am. My TBI context, how I think, what I'm building, what drains me, what gets me going. The agent reads this at the start of every conversation. It knows the room before I say a word.

## Memory

Then there's MEMORY.md.

111 lines max. That's the rule. It's an index, not a dump. Every entry points to a topic file. Need the full story on the email triage pipeline? Follow the pointer. The index stays lean. The detail lives elsewhere.

This matters because context windows aren't infinite. You can't load everything. So you load the map, then pull what you need.

## The Loop

Session files auto-assemble every morning at 5:55am. Daily synthesis runs in two passes. Cron job triggers a handoff to EOM at 6:15am.

The agents share one workspace. Odin drops notes. EOM picks them up. I wake up to a morning briefing already written.

## The Model Is Not the Product

I've run this on four different models. The architecture stays the same. The results stay roughly the same. Because the intelligence isn't in the model. It's in the structure around it.

SOUL.md. USER.md. MEMORY.md. Handoff queues. Cron jobs. Topic files. That's the system.

The model is just the engine. Anyone can bolt in an engine. Building the vehicle is the hard part.

Most people skip all of this and wonder why their AI assistant forgets everything and acts like a different person every session.

It's because there's no architecture. Just vibes and a chat window.

Build the structure first. Everything else follows.
