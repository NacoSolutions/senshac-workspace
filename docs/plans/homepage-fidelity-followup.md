# Homepage PDF fidelity follow-up

## Goal
Match the homepage header, opening project carousel, highlight split, and Spanish PDF copy while preserving localized routes, forms, and confirmed media.

## Non-goals
- Do not change DNS, R2, or Cloudflare configuration, or submit forms.
- Do not use unconfirmed PDF/reference images; retain the existing left-side placeholder.
- Do not change the RUDE route, video URL, or questionnaire behavior.
- User explicitly approved publication and production Pages deployment to cutover.senshac.com on 2026-10-27T14:08Z; use the reviewed PR and CI workflows.

## Context
- Implement on fresh fix/homepage-fidelity-followup branches from origin/main for web and content; coordinate here on docs/homepage-fidelity-followup.
- Before this follow-up, the ES/CA/EN opening block limited the project list to two static slides. It now loads the published collection and configures maxVisible: 2 with scrollStep: 1.
- PDF p.2 shows the La Trobada/Doley pair; p.3 shows a left highlight and RUDE on the right; p.4/5 benefits copy; p.9 contact copy.
- Doley banner and the left highlight source are unconfirmed. Preserve placeholders for missing images.
- User decision: show two carousel cards; each navigation action advances one card. Make visible count and scroll step configurable on the showcase block.

## Steps
- [x] Add content validation/tests for the new scrollStep block setting and Home copy corrections. Confirm failing tests before implementation.
- [x] Add scrollStep to web content schema and Tina fields. Add accessible previous/next controls to the auto-project carousel; advance by the configured number of slide positions, defaulting to one. Preserve maxVisible and the PDF opening 42:58 seam. Add E2E assertions for two visible cards, one-card advancement, header rail alignment, text rule, and feature split.
- [x] Update ES/CA/EN Home block settings, contact/benefits text, and RUDE caption to match the PDF; preserve localized routes and existing media IDs/placeholders.
- [x] Finish repository quality gates, diff review, Seeds integrity, and git diff --check in both repos. Do not publish or deploy.

## Verification
- Content: devenv shell -- bun test — 50 tests pass.
- Web: bun run quality passes; Playwright e2e/homepage-sections.spec.ts passes 8/8; local Tina dev:cms regenerated tina/tina-lock.json with scrollStep.
- Seeds Doctor and Mulch validation pass across workspace, web, and content; git diff --check passes in all three worktrees.
- Publication/deployment is approved but not started. Merge the web PR first, verify its production run, then merge content so its main-branch workflow dispatches the exact content revision; smoke-test ES/CA/EN afterward.

## Rollback
Use the preceding successful Pages deployment in the project deployment history if rollback is needed. Verify the active and previous deployment IDs before promotion; do not roll back without owner approval.

### For Executor
Read order: this plan; web Showcase.astro, index.astro, Header.astro, src/content.config.ts, tina/config.ts, e2e/homepage-sections.spec.ts; content locale home pages, block validator, and focused tests.
Assumed state: fresh worktrees above; Seeds senshac-workspace-c727, senshac-web-c66f, senshac-content-c010.
Owned files: this plan; web showcase/schema/header/home page/E2E; content locale home pages, validator, and tests.
Verification commands: those listed above. No merge, dispatch, or deployment.
