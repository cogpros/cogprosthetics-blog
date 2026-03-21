---
layout: post
title: "The Awareness Layer"
date: 2026-03-25
categories: [cogpros, design]
description: "Enforcement removes human judgment from the loop. A cognitive prosthetic restores it."
surface: blog
---

there's a framework with 80k github stars that forces your AI coding agent to stop and think before it writes code. Socratic questions. design specs. the works.

i looked at it today and liked the pattern. but the implementation was wrong for me.

their version: the AI refuses to start until it's asked enough questions. no choice. enforced discipline. great for developers who skip planning because they're lazy.

my version is different because my problem is different.

i had a brain injury in 2016. one of the things it took was prospective memory. knowing you need to do something at a future moment. you know the tools exist. you know when to use them. but the connection between seeing the situation and reaching for the right response doesn't always fire.

so instead of enforcement, i built an awareness layer. my agent watches for patterns and surfaces the tool in one line. "this looks like a PRISM moment." "spec first?" "different angle?"

one line. then it follows my lead.

the difference matters. enforcement removes human judgment from the loop. a cognitive prosthetic restores it. same shape. completely different purpose.

the framework treats AI agents like junior developers who need guardrails. i treat mine like a pattern recognition layer that fills a gap my brain used to fill on its own.

there are nine trigger conditions right now. each one maps a pattern to a tool. multi-file change with no plan stated: "spec first?" same problem attempted twice: "different angle?" creative work produced: auto-save to memory. no question asked.

the whole thing is a markdown table in a config file. no code. no enforcement engine. just a list of situations and what to surface when they show up.

it doesn't always fire. sometimes i blow past it and the agent stays quiet. sometimes it catches me about to edit code i haven't read yet and says "want to read that first?" and that one line saves an hour.

when you build AI tools for people with cognitive disabilities, the design question changes. it's not "how do we make the AI do the right thing." it's "how do we help the human remember to."
