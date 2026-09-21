---
name: warren-run-pr-delivery
description: Deliver a bounded Warren run as a verified, linked pull request.
---

# Warren run and PR delivery

1. Start from one Seeds issue with explicit acceptance criteria, owner, cost or
   scope boundary, and the target repository. Use the repository's Warren
   defaults; scheduled runs remain disabled until those inputs exist.
2. Inspect the worktree and local instructions, then make the smallest change
   that satisfies the seed. Never include secrets or unrelated cleanup.
3. Run the owning repository's quality gate. For workspace-only registry or
   wrapper changes, use `./scripts/workspace-test`; for focused repositories,
   use their documented gate. Resolve warnings and failures before delivery.
4. Review the diff, commit the change with a focused message, and verify
   `git status` and `git log` show a real commit. A staged-only result is not
   delivery.
5. Open a focused PR linked to the Seeds identifier. Include the summary,
   acceptance evidence, gate command and result, known blockers, and the PR
   URL. Do not push manually when Warren owns the host-side push.
6. After review/merge, update the seed with the commit or PR evidence and close
   it only after the final gate is green.

A successful run is reproducible: another operator can find the issue, inspect
the commit, rerun the gate, and understand the delivery decision.

## Commands and acceptance

For this workspace, run `./scripts/workspace-test`; use `git diff --check`,
`git status --short`, and `git log -1 --oneline` before delivery. Acceptance is
a focused commit, a zero exit gate, and a PR linked to the seed (or an explicit
host-side delivery handoff).
