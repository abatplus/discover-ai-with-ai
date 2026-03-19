# Session 6 – Systematic Debugging (Optional)

> **Practical tip:** Don't guess where bugs are. Let Claude systematically analyze the evidence – reproduce, hypothesize, verify, fix.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** Systematic debugging with Superpowers – instead of trial and error.

**Demo – Plant a bug:**

> **Prompt** – copy the following into Claude Code:
```
Plant a subtle bug in the project – for example an off-by-one error
in a list operation or a wrong status transition.
Don't tell me where the bug is. Just make a test fail.
```

**Demo – Find the bug:**

Start a new Claude Code session and say:

> **Prompt** – copy the following into Claude Code:
```
The tests are failing. Use /superpowers:systematic-debugging to find and fix the bug.
```

**Your turn:** Do you have a real bug in one of your projects? Let Claude analyze it systematically.

**What you learned:**
- Systematic debugging follows a process: Reproduce → Hypothesize → Verify → Fix
- Claude approaches problems structurally, not randomly
- This works for real bugs in real projects too

---

**What's next?**

- Try more sessions? → Check the [overview](../../LEARNING-PATH.md)
- Ready to give feedback? → Tell Claude: "I want to give my feedback now. Read the file sessions/12-feedback/feedback-prompt.md and start the interview."
