---
name: git-workflow
description: Make focused, reviewable commits for Senshac workspace changes.
---

# Git workflow

1. Begin with `git status --short --branch` and inspect the relevant diff before
   editing. Keep Warren-rendered and session state outside the change.
2. Keep the change focused, then run `git diff --check` and review
   `git diff --stat` plus the complete diff.
3. Stage the intended documentation, skill, or configuration files with
   `git add <paths>`, while keeping `.seeds`, `.mulch`, secrets, and generated
   session state outside this workflow.
4. Commit with a concise imperative message, then verify `git status --short`
   and `git log -1 --oneline`; Warren performs host-side delivery.

## Acceptance checks

- The commit contains only the intended repository-local guidance changes.
- `git diff --check` exits zero.
- The worktree is clean except for pre-existing Warren runtime artifacts.
