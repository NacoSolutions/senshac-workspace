---
name: modular-cutover
description: Coordinate Senshac legacy-to-modular cutover without crossing repository or approval boundaries.
---

# Modular cutover

Use this skill for workspace-level acceptance of the modular Senshac migration.

## Workflow

1. Start from the canonical workspace Seeds epic and its open child; keep one implementation repository and one delivery per bounded seed.
2. Verify the content, web, media, and infrastructure owners' contracts independently. Preserve the archived site as rollback source while acceptance remains open.
3. Run local and preview acceptance against the approved plan: localized route parity, Tina editorial flow, media/R2 delivery, SEO, accessibility, performance, observability, and secret boundaries.
4. Record reproducible evidence and unresolved dependencies on the owning Seed. Keep production promotion and rollback rehearsal pending until the owner explicitly approves the deployment window and evidence.
5. Close the coordination Seed only after its acceptance and dependencies are met; leave follow-up work in the owning repository rather than duplicating it.

## Safety boundary

This skill coordinates and verifies; it does not authorize deployments, DNS or WordPress changes, production promotion, or deletion of the archived rollback source. Use the focused repository's procedures for any approved operation and retain owner approval with the evidence.

## Acceptance checks

- Each cutover claim links to the source repository, exact revision, and reproducible check.
- Content, application, media, and infrastructure ownership remain separate.
- Production promotion has explicit owner approval, a verified rollback path, and a retained observation window.
