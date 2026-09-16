---
name: modular-cutover
description: Coordinate one bounded change across the Senshac focused repositories.
---

# Modular cutover

1. Read the relevant Seeds record and workspace registry.
2. Identify exactly one target repository and its quality gate.
3. Never edit the archived `senshac` monorepo.
4. Keep TinaCMS content, Cloudflare infrastructure, runner images, media
   processing, and web application changes in their owning repositories.
5. Run the target repository gate before opening a PR.
6. Link the PR to the workspace Seeds record and report cross-repository
   blockers rather than duplicating tracker records.
