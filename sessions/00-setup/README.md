# Session 0 – Setup

## What is Claude actually?

Imagine you get a new colleague on your team. An engineer who:
- Speaks every programming language
- Is available 24/7
- Never gets annoyed when you ask the same question for the third time
- Can read, write, test, and debug code

But this colleague has a quirk: **No long-term memory.** Every conversation starts from zero. They don't remember what you discussed yesterday.

That sounds like a problem. But that's exactly why **process** matters. When you give Claude context – through files, plans, documentation – it works excellently. Without context, it just guesses.

In this learning path, you'll learn to use Claude as a real engineering partner. Not as better autocomplete, but as a colleague you **think, plan, and build** with.

---

**Goal:** Install Superpowers and verify the project works.

**What just happened:** Claude generated a fully functional micro-project for you. Let's make sure everything works and install the tools we need.

**Step 1: Verify the project**

> **Prompt** – copy the following into Claude Code:
```
Build the project and run all tests. Show me the results.
```

**Step 2: Install Superpowers**

Superpowers is a plugin that gives Claude powerful skills for brainstorming, planning, and debugging.

1. Run in Claude Code: `/plugin marketplace add obra/superpowers-marketplace`
2. Run in Claude Code: `/plugin install superpowers@superpowers-marketplace`
3. Start a new Claude Code session (so Superpowers becomes active)

**What you learned:**
- Claude Code can build, test, and verify projects autonomously
- Superpowers adds structured workflows for brainstorming, planning, and debugging
- Context (files, project structure) is the key to good collaboration

---

**Next up:** Open the next session → [01-let-ai-do-it/README.md](../01-let-ai-do-it/README.md)
