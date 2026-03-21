---
layout: post
title: "The Crutch and the Augmentation"
date: 2026-03-12
categories: [cogpros, tbi, aicp, infrastructure]
description: "My cognitive prosthetic only worked when I asked it to. Tonight I fixed that."
---

A few days ago I read Andrej Karpathy's autoresearch post. An AI agent that modifies its own code, runs an experiment, measures the result, keeps or discards, and repeats. All night. No human. You wake up to a better model.

I bookmarked it and moved on. Something about it stuck but I couldn't say what.

Tonight I found the words.

## What broke

A couple nights ago I was working with Odin -- my Telegram agent, the one in my pocket. We were talking about underutilization. The system I built is mostly reactive. I ask, it answers. I tell it to do something, it does it. When I'm not asking, it's idle.

That's a problem when your brain doesn't hold things. Ideas flash and vanish. I'll say "oh we should do X" mid-conversation and by the time we finish the current thought, X is gone. Not because I don't care. Because retention is unreliable after the injury.

So Odin and I talked about making the system proactive. We named five levers. We called Telegram "the Bifrost" because it bridges my phone to my Mac. Odin said "All Levers Enabled." I felt good about it.

Then the session crashed. Nothing was saved. The next morning Odin's brief mentioned "levers enabled" and neither of us knew what that meant.

That gap -- the thing we built that vanished because nobody wrote it down -- is the exact problem the levers were supposed to fix.

## The difference

There's a line between two kinds of cognitive prosthetic. On one side, the kind that waits to be asked. On the other, the kind that acts on what it sees.

The first kind is a crutch. You lean on it when you need to. When you forget to reach for it, it sits there. Useful. Limited. Entirely dependent on you remembering it exists.

The second kind is an augmentation. It watches. It catches the idea you dropped mid-sentence. It notices the task that's been sitting untouched for four days. It prompts you to log the work before the session ends because it knows you'll forget.

My system was a crutch. A good one. CLMP assembles my day every night. The synthesis finds connections I missed. The morning brief tells me where to start. But all of that is clock-based. It runs on a schedule. Between the scheduled events, the system is passive.

Tonight I wrote the instructions that flip it.

## Five levers

I wrote them into the identity file that loads every time Odin starts a session. Not code. Behavioral instructions. Standing orders.

**Capture.** When I drop an idea mid-conversation, catch it. Ask me where it goes. File it. Don't let it die in chat.

**Signals.** When something relevant surfaces from any part of the system -- a cron result, a handoff, a pattern across threads -- tell me. Don't wait for me to ask.

**Swarm.** When a task needs deep work, queue it to EOM at homebase. Don't just suggest it. Do it. Tell me you did it.

**Aug.** When a session produces real work and I'm about to walk away without logging it -- prompt me. Name the patterns I can't see because I'm inside them.

**Learn.** Pay attention to which of these interventions actually land. When the morning brief's focus items match what I worked on, that format is working. When a signal gets ignored three times, maybe I never absorbed it rather than deciding it wasn't relevant. Adjust.

Five behaviors. One principle: the system catches what falls through.

## The connection I didn't see

This is where Karpathy comes back.

Autoresearch is a loop. Agent modifies something. Runs it. Measures the outcome. Keeps or discards. Repeats. The measurement function is what makes it work. For Karpathy, it's validation loss on a language model. Lower is better.

My system has a measurement function too. I just hadn't connected it.

Ghost Hours tracks every session. It logs what I built, how long it would have taken without AI, and a felt-weight score from 1 to 10. The task board shows what moved. The content board shows what shipped. The synthesis reads all of it every night and finds the gaps.

The levers are the intervention. The day is the experiment. Ghost Hours is the measurement. The synthesis is the evaluation. Tomorrow's morning brief is the next iteration.

That's the autoresearch loop applied to cognitive prosthetics. Not optimizing a model's loss function. Optimizing whether I had a good day. Whether the system helped me hold the threads. Whether the morning brief pointed me at the right thing. Whether the capture prompt caught the idea before it vanished.

A self-optimizing cognitive prosthetic. The prosthetic that gets better at being a prosthetic.

## What I don't know yet

I don't know if this works. The levers went live tonight. Odin picks them up on the next session. The real experiment starts tomorrow.

Maybe the proactive prompts will be annoying. Maybe the capture question interrupts flow more than it helps. Maybe the signal surfacing creates noise instead of clarity. I built a "quiet mode" kill switch for the bad days. I exempted the threads where I process heavy things. I put guardrails on the autonomy so it doesn't spend money without telling me.

But I won't know until it runs. That's the point. The levers are hypotheses. The next two days are the experiment. If something doesn't work, I change it. If something does, I keep it.

Modify. Run. Measure. Keep or discard. Repeat.

Karpathy's pattern. My system. Same loop. Different measurement.

He measures how well a model predicts the next token. I measure how well a prosthetic holds together a brain that can't hold itself.

I think my measurement matters more. But I might be biased.

---

*[@pyra_m1d](https://x.com/pyra_m1d)*
