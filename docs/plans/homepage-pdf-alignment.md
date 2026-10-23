# Home Page PDF Alignment

## Goal

Align the localized Home experience with the supplied PDF while preserving questionnaire behavior, confirmed routes, editorial ownership, and current media references.

## Non-goals

- Replace the Home hero image or infer new media IDs. Keep the current hero media and use confirmed project media; render placeholders where content records lack a verified image.
- Change questionnaire forms, query-string routes, contact submissions, project records, or project URLs.
- Dispatch content, merge PRs, or deploy Pages.
- Continue browser-tool research. Another agent owns the Chromium, Firefox, browsh, browser-cli, Crawlberg, and xberg investigation.

## Context and decisions

- Reference review covered the complete 11-page `WEB HOME PAGE.pdf`: p. 1 hero/header; pp. 2–3 project images and copy; pp. 4–5 one accordion shown closed and open; pp. 6–8 process introduction and rail; pp. 9–10 contact and three visible featured projects; p. 11 footer.
- Current locale pages are `senshac-content/pages/{es,ca,en}/home.json`. They contain the old “Comunica. Cautiva. Conecta.” showcase title, a single RUDE card, one accordion, an HLS video, process/contact lists, and an unlinked Instagram feed.
- Existing confirmed Home media IDs are `projects/la-trobada/cover` and `projects/rude/cover`. The current Doley record has no banner media ID. The second RUDE-showcase image is unassigned. Use placeholders for these missing images.
- The project collection already supplies localized titles, categories, descriptions, dates, and routes. The featured carousel uses the three most recently published existing records, capped at three; its desktop view shows all three.
- Keep the Home hero media and CTA route unchanged; tune copy placement, size, and order only.
- Reorder navigation and footer links as `Services/Projects/About/Contact` equivalents in each locale. Keep footer labels localized; set the design credit brand to `Sens*hac` and development credit to `Naco Solutions`.
- The workspace-level `devenv` already includes Crawlberg and Chromium from the earlier request. Crawlberg screenshot capture remains under separate investigation; use the already captured public screenshot only as supplementary visual evidence.
- Engram search tools are unavailable in this session. Repository Mulch records and the prior workspace homepage plan were reviewed.

## Blast radius

- `senshac-web`: header spacing, Home hero typography/layout, project showcase rendering, Tina/Astro content schemas, generated Tina lock, Home rendering tests, and focused Playwright coverage.
- `senshac-content`: localized Home block order, project placeholders, navigation/footer translation data, block-validator allowlist and checks, and localized content tests.
- `senshac-workspace`: this cross-repository execution plan.
- Public routes and questionnaire submission behavior remain unchanged.

## Steps

1. **Web renderer and schema** — In `src/components/sections/editorial/Showcase.astro`, let project showcases accept `limit` and `maxVisible`, render multi-card scroll-snap rows, derive compact category/title overlays from existing project records, and show a neutral placeholder for missing banner media. Preserve the current single-view default for existing callers. Add optional content fields to `src/content.config.ts` and `tina/config.ts`. Verify with `bun test test/showcase-media-items.test.mjs` plus a focused carousel-rendering test.
2. **Web chrome** — In `src/components/Header.astro`, increase desktop navigation spacing. In `src/components/sections/editorial/Hero.astro`, place the tagline before the headline, reduce headline size, and align the copy to the reference while preserving hero media and CTA. Verify with focused chrome/hero tests and the Home Playwright test.
3. **Content and contracts** — In `pages/{es,ca,en}/home.json`, remove the old showcase slogan, set the opening project carousel to two visible cards, retain the RUDE link and cover in a two-item showcase with one placeholder, place the existing copy and single accordion before the confirmed HLS video, retain method/process/contact content, add `Proyectos destacados` with `limit: 3` and `maxVisible: 3`, then place the link-disabled Instagram feed last. In `translations/{es,ca,en}.json`, reorder localized navigation/footer links and update footer credits; remove duplicate `attributions` keys while editing them. Extend `scripts/validate_blocks.mjs` and `tests/showcase_limits.test.mjs` for positive integer showcase limits. Update `tests/web4_home_method.test.mjs`, `tests/navigation_labels.test.mjs`, and `tests/footer_attributions.test.mjs`. Verify with `bun run quality:content`.
4. **Generated schema and web verification** — Run `bun run tina:generate` with the sibling content worktree in `TINA_LOCAL_CONTENT_PATH`; check `tina/tina-lock.json` before and after generation. Use Bun-invoked web checks (`bun run lint`, `bun run test`, `bun run typecheck`, `bun run build`, admin-routing, preview, and repository checks), then `bun run test:e2e`. Do not use `bun run quality`: that aggregate currently shells out to npm. For uncommitted content tests, pin `SENSHAC_CONTENT_REVISION` to a temporary local snapshot; the sync script archives commits, not the working tree.
5. **Delivery review** — Run `seeds doctor`, `mulch validate`, and `git diff --check` in each owning repository. Review only named files, commit focused changes, and open review PRs. Keep web support ahead of content publication. Do not merge, dispatch, or deploy without explicit approval.

## Verification commands

- Content: `bun run quality:content`
- Web: `bun install --frozen-lockfile`; `bun run tina:generate` with local content; `bun run check:tina-lock`, `bun run lint`, `bun run test`, `bun run typecheck`, `bun run build`, `bun run check:admin-routing`, `bun run preview:check`, `bun run repository:check`, and `bun run test:e2e`. Do not use the aggregate `bun run quality` because it currently shells out to npm.
- Each repository: `seeds doctor`, `mulch validate`, `git diff --check`
- Workspace plan: `git diff --check`

## Rollback

Revert the focused branch commits in the affected repositories. Content remains source-controlled and unpublished until its approved dispatch workflow runs. Missing-image placeholders are explicit reversible content entries.

## Open questions and risks

- Missing Doley and second showcase media remain placeholders by user choice. Replace them only after an exact existing media ID and source mapping are confirmed.
- The PDF hero image differs from the deployed Home hero. This plan preserves the deployed image; exact hero-image parity remains a separate media-mapping follow-up.
- Crawlberg screenshot capability is not claimed as verified; the browser investigation is owned by another agent.

### For Executor

Read order: this plan; web `Showcase.astro`, `Header.astro`, `Hero.astro`, `src/content.config.ts`, `tina/config.ts`; content Home pages, translations, validator, and focused tests.

Assumed working state: `feat/homepage-pdf-alignment` in web/content and `docs/homepage-pdf-alignment` in workspace, each based on fetched `origin/main`; existing parent/child Seeds are `senshac-workspace-b438`, `senshac-web-afae`, and `senshac-content-a479`.

Owned files: the named web/content paths above, this plan under `docs/plans/homepage-pdf-alignment.md`, and the corresponding existing Seed records.

Verification commands: `bun run quality:content`; web: `bun run tina:generate` with `TINA_LOCAL_CONTENT_PATH`, `bun run check:tina-lock`, `bun run lint`, `bun run test`, `bun run typecheck`, `bun run build`, `bun run check:admin-routing`, `bun run preview:check`, `bun run repository:check`, and `bun run test:e2e` with a pinned `SENSHAC_CONTENT_REVISION`; `seeds doctor`; `mulch validate`; `git diff --check`. Avoid `bun run quality` while it shells out to npm.
