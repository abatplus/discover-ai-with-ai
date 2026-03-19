# Session 8 – Documentation Without Pain (Optional)

> **Practical tip:** You describe WHAT should be documented – Claude writes it. In any format: Confluence, Markdown, AsciiDoc, OpenAPI.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** Claude writes docs for you – Confluence articles, ADRs, release notes.

**Demo:**

> **Prompt** – copy the following into Claude Code:
```
Look at the recent changes to the project (the new features we built).
Create a Confluence article in Confluence Wiki Markup that documents
the Task API project: what it does, which endpoints it has,
how to start it.
Save the result as docs/confluence-task-api.txt.
```

**Explanation:** Claude generates ready-to-use Confluence markup. You can paste it directly into Confluence: Create page → top right `...` → "Insert Wiki Markup".

**Your turn:** Have Claude create another doc – e.g.:
- An ADR (Architecture Decision Record) for a technical decision in the project
- Release notes for the recent changes
- API documentation for one of your own projects

**What you learned:**
- Claude can create docs in any format (Confluence Markup, Markdown, AsciiDoc)
- You describe WHAT should be documented – Claude writes it
- Documentation is no longer an excuse

---

**What's next?**

- Try more sessions? → Check the [overview](../../LEARNING-PATH.md)
- Ready to give feedback? → Tell Claude: "I want to give my feedback now. Read the file sessions/12-feedback/feedback-prompt.md and start the interview."
