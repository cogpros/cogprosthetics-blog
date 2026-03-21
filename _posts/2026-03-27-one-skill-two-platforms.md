---
layout: post
title: "One Skill, Two Platforms, One Log File"
date: 2026-03-27
categories: [skills, portability]
description: "The spec is the product. The platform is just where it runs."
surface: blog
---

i wrote a Ghost Hours skill for Claude Code. it logs how long a task would have taken without AI, classifies the session, and writes a JSONL entry. built it over weeks. tuned it across 125 sessions.

yesterday i wanted to see if it worked on Cowork. different platform. different runtime. different file mounting. i installed the skill from the GitHub repo, ran the command, and it worked first try.

zero code changes. two files changed. a metadata block added to the skill manifest, and install instructions updated in the README.

the skill wrote to the same log file on my Mac. same format. same data. same location. the platform was different. the skill didn't care.

this is what agent skills should be. not "works on my setup." not "requires our runtime." a markdown spec, a prompt, and a log file. the platform is a delivery mechanism. the skill is the thing.

i've been thinking about this wrong. i was building for Claude Code because that's where i work. but the skill isn't a Claude Code feature. it's a measurement framework that happens to run inside an agent. the agent is the host. the skill is portable.

one skill. two platforms. one log file.

the implication: every skill i build from here is cross-platform by default. the spec is the product. the platform is just where it runs.

for me this matters more than most. my system is a cognitive prosthetic. if it only works in one tool, it's fragile. if the skill travels, the capability travels with it. i'm not locked to a vendor. i'm not locked to a runtime. the thing that helps me think doesn't disappear when a platform changes its pricing.
