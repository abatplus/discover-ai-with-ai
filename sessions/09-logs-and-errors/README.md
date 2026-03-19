# Session 9 – Logs & Error Analysis (Optional)

> **Practical tip:** Stop Googling stack traces. Paste them into Claude and get an instant explanation with a fix.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** Claude analyzes logs, stack traces, and CLI output for you.

**Demo:**

> **Prompt** – copy the following into Claude Code:
```
Start the Task API, send a few requests, and show me the logs.
Then analyze: Are there any notable patterns, warnings,
or potential issues?
```

**Your turn:** Try it with real data from your daily work:
- Paste a stack trace from your project into the chat and ask: "What does this mean and how do I fix it?"
- Or: "Run `docker logs <container>` and analyze the last 100 lines"
- Or: "Parse this log file and find all errors from the last hour"

**Tips:**
- You can paste any CLI output directly into the chat
- Claude can also run commands like `docker logs`, `kubectl logs`, `journalctl` for you and interpret the results

**What you learned:**
- Claude can read log output and recognize patterns
- Stack traces get instantly explained instead of painfully Googled
- CLI tools become more powerful when Claude interprets them for you

---

**What's next?**

- Try more sessions? → Check the [overview](../../LEARNING-PATH.md)
- Ready to give feedback? → Tell Claude: "I want to give my feedback now. Read the file sessions/12-feedback/feedback-prompt.md and start the interview."
