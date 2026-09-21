---
name: trellis-readiness-drift
description: Check Jayminwest Trellis readiness and canonical drift before delivery.
---

# Trellis readiness and drift

Use the repository's pinned Jayminwest Trellis revision; do not silently fetch
or substitute a moving version.

1. Read the local agent guidance and identify the directory being audited.
2. Install the pinned Trellis dependencies with the lockfile, then run the
   equivalent of `trellis ... audit <target> --no-persist --no-output` with an
   explicit non-destructive failure policy appropriate to the repository.
3. Run the equivalent of `trellis ... drift <target>` against the canonical
   source. Treat readiness findings and drift findings as separate evidence.
4. Fix actionable readiness or canonical-source drift in the owning repository,
   rerun both checks, and include the commands and results in the PR. Do not
   persist generated output as a side effect of an audit.
5. If a finding is intentionally deferred, link the owning issue and state the
   impact; never hide it by weakening the audit or drift command.

The workspace's readiness workflow is the reference contract: pinned tooling,
non-persisting audit, and an explicit drift check.

## Commands and acceptance

Use the repository's pinned `trellis` invocation for `audit <target> --no-persist
--no-output` and `drift <target>`. Acceptance is both checks recorded, with
findings fixed or linked to an owning issue.
