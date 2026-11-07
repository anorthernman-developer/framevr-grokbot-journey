# Capabilities and limits

## Confirmed (Frame Automate API v0.66.3)
Base URL `https://api.framevr.io`, header `Authorization: Bearer <API key>`. `frameRef` is the Frame's name, for example `letscollaborate`.

| Area | Operations |
|---|---|
| Frame settings | `GET`/`PATCH`/`DELETE /automate/v1/frame/{frameRef}` |
| Members | `GET /automate/v1/member/{frameRef}`, `POST`/`DELETE …/{memberEmail}` |
| Admins | `GET /automate/v1/admin/{frameRef}`, `POST`/`DELETE …/{adminEmail}` |
| Assets | `POST /automate/v1/asset/{frameRef}/{assetType}`, `GET`/`PATCH`/`DELETE …/{assetType}/{assetId}` |
| Scenes | `GET /automate/v1/scene/{frameRef}`, `PUT …/{scene}` (switches the active scene) |

Asset types: images, models, shapes, audios, pdfs, spheres, videos, spawn-spots, texts, particles, voice-zones, streaming-screens, polls, news, shaders, text-areas, NPCs, agents, whiteboards, basemodel-chairs, remotebrowsers.

Read-only GETs against `letscollaborate` returned 200 with a valid key and 401 without one.

## Unclear
- The tutorial lists "send a text chat to the whole Frame", but the v0.66.3 spec has no chat endpoint.
- Plan gating: the API is open for now but "may be limited to paid plans in the future".
- Rate limits aren't documented.

## Proposed integrations (not built or tested)
- Grok Bot as an operator: it reads a Frame, plans changes, and applies them through `PATCH` only after a human approves.
- Scheduled scene switching for events, such as a talk followed by a breakout.
- Content sync that pushes images, PDFs or news from a CMS or feed into assets.
- Membership sync from a sign-up list.
- In-world agents and NPCs, using the `agents`/`NPCs` asset types. We still need to check their schema.
