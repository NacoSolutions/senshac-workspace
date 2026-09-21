---
name: seeds-issue-lifecycle
description: Audit and advance one Seeds issue without losing ownership or evidence.
---

# Seeds issue lifecycle

Use this workflow for every issue mutation:

1. **Audit first.** Read the issue, its parent/children, dependencies, and the
   repository registry. Confirm the issue is the right bounded unit and record
   its current status, owner, and acceptance criteria.
2. **Choose one owner.** Work in the repository named by the issue or workspace
   registry. Do not duplicate the issue in another repository; create a linked
   follow-up only when ownership genuinely changes.
3. **Advance deliberately.** Use the repository's `sd` commands (`sd ready`,
   `sd show`, and the documented mutation command) rather than editing JSONL by
   hand. Keep status, title, links, and acceptance criteria truthful.
4. **Leave evidence.** Add the useful command output, test result, PR/commit
   link, or blocker to the issue. A blocked issue says what is missing and who
   can unblock it.
5. **Close only at the end.** Re-read the acceptance criteria, run the owning
   repository's quality gate, link the delivered change, then close the issue.
   Reopen it instead of silently weakening criteria when verification fails.

Keep the audit and the final lifecycle change separate enough that a reviewer
can see what changed and why.

## Commands and acceptance

Use `sd ready`, `sd show <id>`, and the repository-documented mutation command;
run `sd sync` only when the local workflow calls for it. Acceptance is a
truthful owner/status, linked evidence, and a green owning-repository gate.
