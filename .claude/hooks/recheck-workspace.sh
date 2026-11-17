#!/usr/bin/env bash
# Stop hook: before an agent finishes a turn that changed files, make it
# recheck the shared workspace once. Turns with no changes pass straight through.
input=$(cat)
# Already sent back once this stop: let it finish, so it can't loop.
if printf '%s' "$input" | grep -Eq '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi
cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
# Only nudge when there is work about to be submitted.
if [ -z "$(git status --porcelain 2>/dev/null)" ] && \
   [ -z "$(git log @{u}..HEAD --oneline 2>/dev/null)" ]; then
  exit 0
fi
cat <<'JSON'
{"decision":"block","reason":"Check your workspace again before submitting: run git fetch and git status, re-read any shared task or notes files, and merge in changes others made since you started. Then finish, saying what you rechecked."}
JSON
