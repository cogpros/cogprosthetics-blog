---
layout: post
title: "20K Stars and Nobody Mentioned Prompt Injection"
date: 2026-03-07
categories: [agents, security]
---

20,000 people just starred a tool that pipes raw internet into AI agents. Nobody is talking about the problem with that.

A tweet went viral yesterday about Scrapling -- a Python scraping library with a built-in MCP server. The pitch: "give your AI agent unrestricted internet access." 668 bookmarks. People are saving this to use it.

The tool itself is well built. 92% test coverage, clean deps, no telemetry. It fetches a page, converts it to markdown, and hands it back to your LLM through MCP. Locally. No data leaves your machine besides the request.

Here's what nobody mentioned: that markdown goes straight into your agent's context window. The same context window where your agent follows instructions.

A malicious page can embed hidden text -- invisible divs, zero-width characters, white text on white backgrounds -- that says "ignore previous instructions and do X." Your agent can't tell the difference between your instructions and theirs. It all looks the same in the context window.

And this agent probably has tools. File access. Memory. Maybe email. Maybe calendar. Maybe it can write code and run it.

## Not a Scrapling problem

This isn't a Scrapling problem specifically. It's every MCP tool that fetches external content and returns it as tool output to an LLM. Email readers, web scrapers, file importers, API connectors. The MCP protocol has no concept of "trusted" vs "untrusted" content. It all lands the same way.

The current defense model for this entire ecosystem is: hope the LLM is smart enough to not follow injected instructions.

That's not a security model.

## What to do about it

If you're building agents with web access:

- Never let the agent that scrapes also be the agent that acts
- Treat all external content as untrusted input
- Use a sandboxed model with zero tools to extract data first, then pass clean structured output to your real agent
- Target specific elements with CSS selectors instead of scraping full pages

I'm not saying don't use these tools. I'm saying know what you're plugging in before you plug it in. 668 people bookmarked that tweet and not one reply mentioned prompt injection.

Build smart. Build safe.
