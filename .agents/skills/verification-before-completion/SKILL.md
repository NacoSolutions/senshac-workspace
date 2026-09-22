---
name: verification-before-completion
description: Prove a focused change before commit, handoff, or completion.
---

# Verification before completion

1. Run the owning repository's documented quality gate.
2. Run `git diff --check`, inspect `git diff --stat` and the complete focused
   diff, then verify `git status --short`.
3. Confirm generated files, tracker evidence, and delivery links match the
   acceptance criteria.
4. Commit only after the checks pass; report exact commands and results.

Acceptance: zero-exit quality gate, clean whitespace, reviewed diff, truthful
tracker state, and a real commit.
