---
layout: post
title: "The Restructure"
date: 2026-03-23
categories: [memory, infrastructure]
description: "If your AI memory keeps growing, you don't have a size problem. You have a category problem."
surface: blog
---

my memory index hit 211 lines the other day. the limit is 111.

not a soft limit. past 200, the system truncates. whatever's on line 201 just doesn't load. the agent doesn't know it's missing. it doesn't tell you.

sound familiar? that silent failures. except this time the failure was structural, not a broken pointer.

the problem: MEMORY.md was trying to be two things. a set of rules that shape every session. and an inventory of everything that exists.

rules don't grow fast. "no em dashes, dashes or double hyphens" is a rule. it's been there for weeks. it's not going anywhere.

inventory grows every time you build something. new project, new pipeline, new person, new tool. two lines each. do that thirty times and you're at 201 wondering what got cut.

the fix wasn't trimming lines. I've done that three times already. you trim ten, add twelve the next week. you're bailing water.

the fix was splitting the file in two. conceptually.

MEMORY.md now holds rules only. behavioral directives, triggers, voice rules, workflow preferences. things the agent needs from message one. 74 lines. room to breathe.

everything else -- project state, script locations, build status, people details -- lives in topic files. searched on demand via a semantic search layer I built on top of the memory directory.

the agent doesn't need to know where every script lives at boot. it needs to know how to find it when the topic comes up. that's a different problem with a different solution.

went from 201 lines to 74. and it'll stay under 100 likely. because rules accumulate slowly. inventory doesn't live there anymore.

the deeper lesson: if your AI memory keeps growing, you don't have a size problem. you have a category problem. figure out what actually needs to load every session. move everything else behind a search layer.

for some of us, a memory system that quietly drops information isn't an inconvenience.

it's the thing we built the whole system to prevent.
