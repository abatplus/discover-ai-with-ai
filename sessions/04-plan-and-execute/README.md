# Session 4 – Plan and Execute

> **Practical tip:** Never let AI implement without a plan. A 5-minute planning phase saves hours of rework.

> **Important:** Start a fresh Claude Code session for this one. A new context keeps Claude focused.

**Goal:** The complete cycle – from idea to finished feature, entirely through conversation with Claude.

**Prerequisite:** Session 3 should be completed. The brainstorming result is saved as a file in the project (Superpowers saves it automatically under `docs/plans/`). Claude finds it in the new session because the file is on disk – even without conversation history.

**Demo 1 – Create the plan:**

> **Prompt** – copy the following into Claude Code:
```
/superpowers:write-plan
Create an implementation plan based on the brainstorming result
from the last session.
```

Claude creates a detailed plan with individual tasks, exact file paths, code examples, and a test-first approach.

**Read through the plan.** If something doesn't fit, tell Claude – e.g.:
- "Task 3 is too complex, split it up"
- "I don't want a separate service class, keep it simple"
- "Add a task for error handling"

**Demo 2 – Execute the plan:**

> **Prompt** – copy the following into Claude Code:
```
/superpowers:execute-plan Execute the implementation plan.
```

**Your turn:** Watch how Claude executes the plan step by step. It will:
- Write tests first, then implementation
- Commit after each step
- Ask for your feedback at review points

**What you learned:**
- Planning before implementation saves time and prevents dead ends
- You steer the process – Claude executes
- The cycle Brainstorm → Plan → Review → Implement is extremely powerful

---

**What's next?**

- Try more sessions? → Check the [overview](../../LEARNING-PATH.md)
- Ready to give feedback? → Tell Claude: "I want to give my feedback now. Read the file sessions/12-feedback/feedback-prompt.md and start the interview."
