# Discover AI with AI

An interactive, self-generating learning path that teaches you how to use AI coding agents as real working partners — not just autocomplete.

## What is this?

This repo contains a prompt file that, when run with an AI coding agent, automatically generates:

- A fully functional micro-project in your preferred language (Java, C#, or TypeScript)
- 12 interactive sessions that teach you different ways to use AI agents
- Everything you need to go from "I only know autocomplete" to "AI is my daily working partner"

## Choose Your Tool

This learning path is available for two AI coding agents. Pick the one you have access to:

### Option 1: Claude Code (recommended)

**Prerequisites:**
1. **Claude Code** must be installed → [Installation Guide](https://docs.anthropic.com/en/docs/claude-code/overview)
2. **Visual Studio Code** (recommended) → [Download](https://code.visualstudio.com/)

**Getting Started:**

Open your terminal (we recommend VS Code's integrated terminal) and run:

```bash
cat start.md | claude
```

Alternatively, open Claude Code in the VS Code sidebar and type: `Read start.md and follow the instructions`

> **Why terminal?** The terminal version of Claude Code always gets new features first — like voice input, background agents, and more. Use it inside VS Code's integrated terminal for the best of both worlds.

### Option 2: GitHub Copilot (Agent Mode)

**Prerequisites:**
1. **Visual Studio Code** → [Download](https://code.visualstudio.com/)
2. **GitHub Copilot** subscription (Individual, Business, or Enterprise)

**Getting Started:**

1. Open this directory in VS Code
2. Open Copilot Chat (`Ctrl+Cmd+I` / `Ctrl+Alt+I`)
3. Make sure **Agent** mode is selected (dropdown at the top of the chat)
4. Type: `Read start-copilot.md and follow the instructions`

## What You'll Learn

| # | Session | Duration | Type |
|---|---------|----------|------|
| 0 | [Setup](sessions/00-setup/) | 5 min | Core |
| 1 | [Let AI Do It](sessions/01-let-ai-do-it/) | 10 min | Core |
| 2 | [Context is King](sessions/02-context-is-king/) | 15 min | Core |
| 3 | [Thinking with AI](sessions/03-thinking-with-ai/) | 20 min | Core |
| 4 | [Plan and Execute](sessions/04-plan-and-execute/) | 25 min | Core |
| 5 | [Research with AI](sessions/05-research/) | 15 min | Optional |
| 6 | [Systematic Debugging](sessions/06-debugging/) | 20 min | Optional |
| 7 | [Cross-Project Learning](sessions/07-cross-project/) | 15 min | Optional |
| 8 | [Documentation Without Pain](sessions/08-documentation/) | 15 min | Optional |
| 9 | [Logs & Error Analysis](sessions/09-logs-and-errors/) | 15 min | Optional |
| 10 | [Git & PR Workflows](sessions/10-git-and-prs/) | 15 min | Optional |
| 11 | [Into Your Real Project](sessions/11-real-project/) | 20 min | Optional |
| 12 | [Feedback](sessions/12-feedback/) | 10 min | Wrap-up |

---
<sub>We still write code. We just stopped writing it alone.<br>Crafted by [<img src="https://beyond-bits.de/favicons/favicon-16x16.png" width="12" height="12" alt="" align="absmiddle"> beyond-bits.de](https://beyond-bits.de)</sub>
