---
layout: post
title: "Research Before Building"
date: 2026-04-06
categories: [cogpros, building, ai-tools]
description: "I spent 4 hours building custom Python bots for something the platform already did. The pattern costs more than any bug."
---

i spent 4 hours building custom Python bots to connect my AI agents to Discord. wrote the handlers. wrote the message routing. wrote the error recovery. deployed them as LaunchAgents. felt productive the whole time.

the platform i was already using had Discord support built in. configured, token saved, enabled. it was right there in the channel list.

my agent and i built the wrong thing because building feels like progress and reading docs feels like stalling. i even asked early on, "is this how other people do it?" my agent said yes and kept going. three hours on fragile code the gateway already handles natively.

one evening of actually reading the docs and a guide a friend had already written, and the whole migration was done. three bots, twelve cron jobs, all cleanly separated. the custom code got deleted.

this happens to everyone right now. tools are changing weekly. features ship before you know they exist. the model you're building a wrapper around just added the thing you're wrapping. the platform you're extending already extended itself.

the instinct to build is strong. especially with AI. you can scaffold something in twenty minutes that used to take a week. so you scaffold first and check later. or you never check at all.

the pattern i missed is simple: before building anything, check what already exists. not "i'll check after i get something working." before. run the help command. read the changelog. ask the community. look at what shipped last week.

i wrote this down as a rule for my agent. understand before acting. it's now the first rule in the system, above everything else. because i've been building with AI every day for two months and this pattern has cost me more time than any bug, any outage, any architectural mistake.

the tools are moving fast. the people who waste the least time aren't the fastest builders. they're the ones who check if the thing already exists before they start.
