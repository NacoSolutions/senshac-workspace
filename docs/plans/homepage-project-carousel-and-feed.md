# Home project carousel, video, and Instagram feed

## Outcome
Arrange the Home page as: hero → project carousel → existing RUDE feature → first copy → recovered homepage video → existing method content → Instagram feed after the next text section → existing process and contact sections.

## Decisions
- Replace the current second `banner` image block with the existing data-driven `showcase` carousel. Preserve its localized title as the section title and its studio mark as the eyebrow.
- Keep the following RUDE showcase and its existing `projects/rude/cover` media ID and localized `/works/rude` link. Do not infer additional RUDE image IDs.
- Restore the HLS video from the prior Home content history: `https://media.senshac.com/videos/redesign/horizontal-1-corto/master.m3u8`, immediately after the first text block.
- Restore the previous Instagram feed after the accordion text section. Add an optional feed-level `disableLinks` flag; when true, omit post and profile anchors while retaining the media. The default remains link-enabled.
- Keep locale routes, project records, method copy, process steps, inquiry links, and all submission behavior unchanged. No deployment or content dispatch without approval.

## Work and ownership
1. **senshac-web** — expose `disableLinks` in the Tina and Astro content schemas; conditionally omit Instagram links; label carousel slides with small project headings; update the Tina lock and focused tests.
2. **senshac-content** — update `pages/{es,ca,en}/home.json`, allow the new feed field in the validator, and test the localized section order and preserved RUDE link.
3. Verify the content branch through the web build using `SENSHAC_CONTENT_PATH`; review both diffs. Merge web support before content changes can be published.

## Verification
- Content: block validation, export contract, localized homepage layout tests.
- Web: Tina lock check/generation, typecheck, unit suite, build, preview route checks, and Playwright assertion that the Home feed has no Instagram anchors.
- Inspect the final diff and do not submit forms or deploy.
