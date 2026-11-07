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


## Text Area schema, seen 7 Nov 2026 (field names and types only)
`GET /automate/v1/asset/{frameRef}/text-areas/{assetId}` returns `{message, data}`. `data` contains:
`type` (str, `"text-areas"`), `id`, `name`, `owner`, `text`, `fontFamily`, `fontSize` (int), `align` (str), `textAlignment` (int), `transparent` (bool), `useAPI` (bool), `grabLocked` (bool), `assetSlideIds` (list, the scene association), `position`, `rotation` and `scale` (each `{x,y,z}`).
**This type has no `link` field.** A text area alone can't be the clickable interaction.

## Proposed minimal payload (not sent; example values only)
1. `POST /automate/v1/asset/letscollaborate/text-areas` creates an empty asset and returns its id.
2. `PATCH .../text-areas/{newId}` with:
```json
{"name":"Welcome (Grok Bot)","text":"Welcome to Let's Collaborate. Follow our build journey: anorthernman-developer.github.io/framevr-grokbot-journey",
 "fontFamily":"<same as existing>","fontSize":32,"align":"left","transparent":false,
 "position":{"x":"<TBD>","y":1.8,"z":"<TBD>"},"rotation":{"x":0,"y":0,"z":0},"scale":{"x":1,"y":1,"z":1},
 "assetSlideIds":["<active scene id>"]}
```
Still unknown before creating: a clear position. Existing text areas sit in a row, but the API can't show the spawn point or any non-text assets. Also unknown: whether PATCH accepts every field, and which asset type supports a link (the base schema has `link`; we haven't tested which types honour it).

## Browser check, round 2 (7 Nov 2026)
After the email was verified, sign-in worked. The 3D canvas still doesn't render on the GPU-less cloud browser, but flat mode's menus work: Frame Settings (Permissions, Environment, Branding marked Pro, Action Editor, Clone, Roles) and the Assets list (Text Label, Text Area, Polls and more). That was enough to read asset IDs. We couldn't see the role label, so we aren't claiming owner or admin. We saw no create control in the asset lists. Still nothing has been created.

## Undo
This deletes only our asset:
`DELETE /automate/v1/asset/letscollaborate/texts/{ourAssetId}`
Send the key through an `Authorization: Bearer` header, from an environment variable.
