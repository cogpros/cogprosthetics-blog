---
layout: post
title: "The System That Reviewed Itself"
date: 2026-03-12
categories: [cogpros, infrastructure, security, aicp]
description: "I built an automated research loop. Then I ran my own adversarial review framework against it. It found a bug that would have killed every single iteration."
---

I built an automated research loop last week. An orchestrator that drops tasks into my agent queue, waits for results, evaluates them, and loops. Overnight work without me in the chair.

Before I ran it, I ran Crucible against it.

## What Crucible is

Crucible is my adversarial review protocol. Five phases. Five specialist reviewers examine the target in parallel. Then a blast radius mapper checks what breaks if something is wrong. Then Red Viper -- an adversarial agent -- tries to actually exploit the system. Then Assayer checks alignment against my existing body of work. The whole thing produces tiered evidence: confirmed exploits at the top, single-reviewer opinions at the bottom.

The key rule: evidence outranks consensus. Five reviewers saying "looks fine" means nothing if Red Viper breaks it.

## What it found

Red Viper confirmed two exploits. One in the batch queue system: each line in a variables file becomes a separate handoff, so an injection line becomes the task heading my agent executes. The other was unsanitized config content passing straight through to handoff files.

Five reviewers surfaced eleven findings total. Five were cross-validated by multiple reviewers. Most were operational gaps: silent failures, missing notifications, no file locking.

But one finding was a hard blocker.

## The naming mismatch

The Integration Engineer caught it. My orchestrator generates a handoff file and then polls for a response file. The response filename is derived from a variable called `target`. But the template that tells my agent what filename to write uses a different variable. The names didn't match.

Every single iteration would have timed out. The orchestrator would sit there for an hour polling for a file that would never appear, because my agent wrote its response to a different filename.

The system would have failed silently. No error. No crash. Just... nothing. For an hour. Then it moves on to the next iteration and does it again.

I would have woken up to five completed iterations with zero results and no explanation.

## The half-fix

I fixed all twelve findings. Ran verification tests. Injection rejection working. SHA-256 integrity checks generating. Lock files preventing concurrent runs. Budget detection catching overspend. All clean.

Then I did an end-to-end dry run. Simulated what the orchestrator would generate and what the template would tell my agent to write.

Still didn't match.

The fix had only landed on one side. I changed the orchestrator to use the right variable, but the template still told the agent to write the old filename. The hard blocker was still there. Hiding in a different file than the one I fixed.

The verification step caught what the fix missed. That's why you test the full chain, not just the individual pieces.

## What this means for cogpros

I'm not a developer. I have a traumatic brain injury that makes learning new technical skills extremely difficult. I built all of this -- the orchestrator, the review framework, the adversarial tester, the fix pipeline -- with two AI agents extending what I can do.

But here's the part that matters: the system I built to review code found a real bug in the system I built to automate work. One tool I made caught a flaw in another tool I made. The infrastructure is reviewing itself.

That's not "AI helping me code." That's a cognitive system with enough depth to catch its own mistakes. The hugr doing quality control on itself.

A year ago I couldn't write a bash script. Now I'm running adversarial security reviews against my own automation infrastructure and catching half-applied fixes during integration testing.

The gap keeps widening. Not between me and other people. Between what I could do last month and what I can do now.

---

*More at [cogprosthetics.com](https://cogprosthetics.com). Find me at [@pyra_m1d](https://x.com/pyra_m1d).*
