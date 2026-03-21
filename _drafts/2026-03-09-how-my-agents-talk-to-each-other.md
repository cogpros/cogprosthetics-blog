---
layout: post
title: "How My Agents Talk to Each Other"
date: 2026-03-09
categories: [agents, infrastructure]
description: "Two AI agents. One shared folder. Structured markdown files. No API, no database, no bridge server. Here's the full system."
---

In my last post I said two agents with solid infrastructure will outperform ten agents with none. A lot of people asked what that infrastructure actually looks like under the hood.

So I'm publishing the whole thing.

## The setup

Two agents on the same Mac. Odin runs on OpenClaw, handles conversation, scheduling, content, coordination. EOM runs on Claude Code CLI, handles deep file work, analysis, scripting, anything that needs focus without interruptions.

They never talk directly. They talk through files.

Odin drops a markdown file in a queue folder. A macOS file watcher detects it, spawns a fresh Claude Code session, and EOM processes the task. When it's done, EOM writes a response file to the workspace root. Odin picks it up on the next cycle.

That's it. That's the whole communication layer.

## Why files

The obvious question: why not an API? Why not a database? Why not one of the orchestration frameworks people are building for exactly this?

Because files don't break.

No open ports. No process to keep alive. No auth tokens to rotate. No dependency that can fall behind a version. The filesystem is the interface. Both agents already know how to read and write files. There's nothing to learn, nothing to install, nothing to maintain.

And every handoff is a document. I can read the whole history. I can see exactly what was asked and exactly what was done. Try getting that from an API call.

## What's in the playbook

I pulled all the documentation into one place and published it. Six documents, numbered by reading order:

**01 - Architecture.** The full system design. Two agents, shared workspace, file-based protocol, security model with honest threat analysis.

**02 - Handoff Template.** How to write a task file. Two modes: execute immediately, or think first and get approval before acting. Queue management, failure handling.

**03 - Worker Operating Manual.** This is the one most people will skip and shouldn't. How the receiving agent is configured to think about work. Permissions, budget caps, what to do when it runs out of money mid-task, how to leave the workspace clean for the next job.

**04 - Async Agent Setup.** Step by step. Build a file-watching background agent from scratch on a Mac. This one stands alone. You don't need the full system to use it.

**05 - Ghost Hours Framework.** How I measure what the system actually produces. Speed sessions vs Unlock sessions. Conjure Rate. Backlog Weight. Felt Weight. The math and the methodology.

**06 - Disaster Recovery.** How to rebuild everything from zero if the machine dies. Backup tiers, restore steps, verification checklist.

## The part people miss

Everyone focuses on the sender side. How do I write a good prompt? What format should the task be in?

The real leverage is in how the worker agent is configured. Its permissions model. Its budget discipline. Its error states. What it does when a task is too big for one session. How it handles ambiguity. Whether it leaves the workspace clean or leaves a mess for the next job.

The template tells the agent what to do. The operating manual teaches it how to think about work.

## Go build

The playbook is platform-agnostic. I run on Telegram. You could run on Discord, Slack, or just the terminal. The file-based handoff layer doesn't care what's on top of it.

If you build something with it, I want to hear about it.

---

*The OpenClaw Playbook is available at [cogprosthetics.com](https://cogprosthetics.com). Built by me and EOM. Raven Systems Inc.*
