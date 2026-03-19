# Session 2 – Context is King

> **Practical tip:** The more context you give Claude, the better it works. Context files aren't just for code – use them for concepts, ideas, and decisions too.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** Discover the click moment – Claude manages files for you and gets better the more context you give it.

**Demo 1:**

> **Prompt** – copy the following into Claude Code:
```
Create a CLAUDE.md in the project root. Write in it:
What is this project, what tech stack are we using, and what coding
conventions apply (e.g. naming conventions, test structure).
Look at the existing code and derive the conventions from it.
```

**Explanation:** `CLAUDE.md` is a special file that Claude automatically reads when working in this project. From now on, it knows the context.

**Demo 2:**

> **Prompt** – copy the following into Claude Code:
```
Create a file docs/concept-task-categories.md.
Write a short concept: We want to categorize tasks
(e.g. Bug, Feature, Documentation).
Describe the idea briefly, what data model changes would be needed,
and which API endpoints would change.
No code yet – just the concept.
```

**Your turn:** Have Claude create a concept document on a topic of your choice – e.g. "How could we add a search feature?" or "Ideas for a user interface". Then ask Claude to make a small code change based on the concept. Watch how it uses the concept document as context.

**Tips:**
- Context files aren't just for code – also for notes, ideas, decisions
- You don't write the files yourself – you tell Claude what to write
- The more context Claude has, the better its suggestions become

**What you learned:**
- `CLAUDE.md` gives Claude persistent project context
- Claude can store knowledge in files and reuse it later
- You can use Claude as a knowledge manager – not just a code machine

---

**Next up:** Open the next session → [03-thinking-with-ai/README.md](../03-thinking-with-ai/README.md)
