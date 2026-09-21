---
name: senshac-agent-principles
description: Apply portable principles for bounded Senshac workspace work.
---

# Senshac agent principles

- **Direct execution:** use the repository's native Seeds, Mulch, Canopy,
  Worktrunk, and workspace commands; do not simulate their results.
- **Specific instructions:** name the desired outcome, files, owner, and gate
  before acting; inspect only the smallest relevant surface first.
- **Positive phrasing:** state what the change should do and what success looks
  like, rather than relying on prohibitions alone.
- **Defense in depth:** combine local guidance, focused checks, the quality
  gate, diff review, and clean commit verification.
- **Gentle coding:** preserve adjacent behavior and state; make the smallest
  compatible edit and avoid unrelated cleanup.
- **Token economy:** prefer targeted reads and bounded commands; stop when the
  acceptance checks pass and report evidence instead of dumping transcripts.

## Acceptance checks

- The requested files are the only intentional changes.
- The applicable bounded gate exits zero.
- `git diff --check` is clean and the result is committed.
