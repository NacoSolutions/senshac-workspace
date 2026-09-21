---
name: git-workflow
description: Make focused, reviewable commits for Senshac workspace changes.
---

# Git workflow

1. Begin with `git status --short --branch` and inspect the relevant diff before
   editing. Leave Warren-rendered or session state untouched.
2. Keep the change focused, then run `git diff --check` and review
   `git diff --stat` plus the complete diff.
3. Stage only intended documentation, skill, or configuration files with
   `git add <paths>`; never stage `.seeds`, `.mulch`, secrets, or generated
   session state for this workflow.
4. Commit with a concise imperative message, then verify `git status --short`
   and `git log -1 --oneline`. Do not push when Warren owns delivery.

## Acceptance checks

- The commit contains only the intended repository-local guidance changes.
- `git diff --check` exits zero.
- The worktree is clean except for pre-existing Warren runtime artifacts.
