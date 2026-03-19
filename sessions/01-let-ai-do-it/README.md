# Session 1 – Let AI Do It

> **Practical tip:** When you ask Claude to change code, don't describe HOW – describe WHAT you want. Claude figures out the implementation.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** Experience how Claude reads, understands, modifies, and verifies code – this is not autocomplete anymore.

**Demo:**

> **Prompt** – copy the following into Claude Code:
```
Add a new field "priority" to the Task entity (Enum: LOW, MEDIUM, HIGH).
Update all endpoints so priority can be set when creating and updating tasks.
Update the tests.
Build the project and make sure all tests pass.
```

Watch how Claude:
- Reads and understands the existing code
- Finds and updates all relevant files
- Updates tests
- Builds and verifies

**Your turn:** Think of another field (e.g. `dueDate`, `description`, `assignee`) and have Claude add it.

**Tips:**
- You can ask Claude to explain what it changed
- If you don't like something, say so – Claude adapts

**What you learned:**
- Claude understands code in context, not just single lines
- Claude can modify multiple files coherently at the same time
- Claude verifies its own work through build and tests

---

**Next up:** Open the next session → [02-context-is-king/README.md](../02-context-is-king/README.md)
