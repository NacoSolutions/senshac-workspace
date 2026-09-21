---
name: senshac-agent-principles
description: Apply portable principles for bounded Senshac workspace work.
---

# Senshac agent principles

- **Direct execution:** use the repository's native Seeds, Mulch, Canopy,
  Worktrunk, and workspace commands, and report their actual results.
- **Specific instructions:** name the desired outcome, files, owner, and gate
  before acting; inspect only the smallest relevant surface first.
- **Positive phrasing:** state the desired action and outcome so success is
  clear and directly verifiable.
- **Defense in depth:** combine local guidance, focused checks, the quality
  gate, diff review, and clean commit verification.
- **Gentle coding:** preserve adjacent behavior and state through the smallest
  compatible edit, keeping the change focused on its outcome.
- **Token economy:** prefer targeted reads and bounded commands; finish when
  acceptance checks pass and report concise evidence.

## Acceptance checks

- The requested files are the only intentional changes.
- The applicable bounded gate exits zero.
- `git diff --check` is clean and the result is committed.
