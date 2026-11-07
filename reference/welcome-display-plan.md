# Welcome display: plan and undo (pending)

**Status: not created.** We stopped on purpose, before making any change.

## Why we stopped
- `POST /automate/v1/asset/{frameRef}/{assetType}` takes no request body. The spec says to create an asset of the same type in the web UI first, then `GET` its JSON, and use that as a template for `PATCH`. So the per-type schema (for example a text asset's content field) isn't published.
- There's no endpoint for listing a Frame's assets, so the API can't show what's already near the entry point.
- If we created the asset blind, it would land at a default position, possibly the origin, and we'd be guessing at its content fields.

## Next step (needs a browser)
1. In the Frame UI, an admin adds one test `texts` asset near the spawn point, then copies its asset ID from the Asset Edit menu.
2. `GET /automate/v1/asset/letscollaborate/texts/{testId}` to get the schema and a known-good position.
3. `POST /automate/v1/asset/letscollaborate/texts` creates our welcome text. Then `PATCH` it with the copied JSON: new text, a position offset slightly from the test asset, and `link` pointing at the public blog. A link on the asset is the one simple interaction for visitors. The base asset schema has a `link` field, but it's untested.
4. Check it with `GET`, then check it visually in the browser.

## Browser check: blocked (7 Nov 2026)
A guest visit from the agent's cloud browser couldn't render 3D. The machine has no GPU, Chrome uses software WebGL (SwiftShader), and the WebGL context was rejected (`fail_if_major_perf_caveat + software gl`). Frame fell back to 2D. Steps 1 and 4 need a browser on a computer with a real GPU, signed in as an admin.

## Undo
This deletes only our asset:
`DELETE /automate/v1/asset/letscollaborate/texts/{ourAssetId}`
Send the key through an `Authorization: Bearer` header, from an environment variable.
