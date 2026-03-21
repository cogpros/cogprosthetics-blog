---
layout: post
title: "Forty-Five Days"
date: 2026-03-11
categories: [cogpros, infrastructure, aicp]
description: "A friend lost 45 days of work in one bad operation. I was one click away from the same thing. My agents made sure it never happens."
---

gmoney lost 45 days of work.

He was migrating between AI coding tools and the migration wiped everything. No version control. No backups. Forty-five days of building, gone in one operation. He posted about it on X. Then he posted that he set up a 12-hour auto-commit so it would never happen again.

I follow gmoney. When I saw the post, my first thought wasn't "that sucks." It was "that's me right now."

## The Audit

I asked EOM to check my setup. The results were bad.

My entire OpenClaw system -- 20,000+ files. Scripts, memory pipelines, agent configs, Ghost Hours logs, cron jobs, handoff queues. The infrastructure that makes my brain work every day. No git. No version control of any kind.

My project directories. No git.

One bad session. One migration. One disk hiccup. All of it gone. Not 45 days. Everything.

## The Fix

EOM mapped every directory. Flagged what needed protecting and what could be excluded. Secrets, API keys, session logs, heavy binary files -- all filtered out. The things that matter -- scripts, configs, memory files, Ghost Hours data -- all tracked.

We initialized git across ten repositories. Built .gitignore files that know the difference between irreplaceable work and regenerable noise. Pushed everything to private repos on GitHub.

Then we built backup-pulse. A script that runs every two hours during my active hours. It walks every repo, checks for changes, commits, and pushes. Silent. No input needed. I never think about it. It just catches me.

From "everything is exposed" to "everything is versioned and backed up offsite" in one session.

## What I Didn't Do

I didn't learn git. I don't know what a rebase is. I don't need to.

I told EOM what gmoney's tweet said. I said "how should we be saving our work?" EOM audited the system, showed me the gaps, built the solution, and deployed it. I approved the moves. I asked the questions. The technical execution happened through the prosthetic.

A non-developer with a TBI now has the same version control infrastructure that professional engineering teams run. Not because I learned to code. Because my agents translate intent into implementation.

## Why It Matters

gmoney is sharp. He builds things. He ships. And he still lost 45 days because the safety net wasn't there.

The tools we build with are powerful. They're also operating directly on our filesystems. Every AI coding session is one bad command away from wiping work that took weeks to create. The tools don't warn you. They just execute.

Version control is boring infrastructure. Nobody talks about it until they need it. Then it's the only thing that matters.

For me the stakes are higher than lost productivity. My memory pipeline, my agent configs, my Ghost Hours logs -- those aren't project files. They're the scaffolding that holds my cognition together. Losing them wouldn't just cost me time. It would cost me function.

backup-pulse runs every two hours now. It doesn't care if I forget. It doesn't care if I'm having a bad brain day. It just works. That's what cognitive prosthetics actually look like. Not flashy demos. Quiet systems that protect you from the things you can't track yourself.

## The Count

Ten repositories. Ninety-two tracked files in OpenClaw alone. Auto-commit every two hours. Private backups on GitHub.

gmoney set up a 12-hour safety net. Mine runs every two. Not because I'm more disciplined. Because my agents don't need to be reminded.

---

*More at [cogprosthetics.com](https://cogprosthetics.com). Find me at [@pyra_m1d](https://x.com/pyra_m1d).*
