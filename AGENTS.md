# Agent instructions

This repository is a shared workspace: humans and several agents (Claude Code,
OpenClaw / JVS Claw, intern agents) may edit it at the same time.

## Shared-workspace rule

**Check your workspace again before submitting.**

Before you commit, push, open a PR, or report a task as done:

1. Re-read the shared state, even if you read it at the start:
   - `git fetch` and `git status` / `git log HEAD..@{u}`: has anyone pushed?
   - Any shared notes or task files (`TASKS.md`, `memory/`, handoff notes),
     if they exist.
2. If something changed since you started, merge it into your work, or say
   in your report that it conflicts. Don't overwrite it.
3. Say in your final message what you rechecked and whether anything changed.
