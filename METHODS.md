# Methods log

| Date (UK) | Method | What we learned |
|---|---|---|
| 2026-11-07 | Read the tutorial at learn.framevr.io/tutorials/frame-api | REST API covers assets, members/admins, chat and settings. The key is under Profile in the sidebar. The page says the API "may be limited to paid plans in the future". |
| 2026-11-07 | Pulled the OpenAPI spec from the Swagger bundle at api.framevr.io/doc/automate/ | "External Automation Api" v0.66.3, server `https://api.framevr.io`, HTTP bearer auth (uuid4 API key). 15 operations, saved in `reference/frame-openapi-0.66.3.json` in the repo. |
| 2026-11-07 | Ran unauthenticated `GET /automate/v1/frame/letscollaborate` | 401, so a key is required |
| 2026-11-07 | Ran authenticated read-only GETs on frame, member, admin and scene for `letscollaborate` | All four returned 200. We published no response bodies. |
| 2026-11-07 | Checked the gh CLI | Signed in and able to publish this repo and the Gist |

The API key went into the agent through a secure input as an environment variable. It is never printed or logged.
| 2026-11-07 | Read-only `GET` of frame and scene for `letscollaborate` (saved privately, not published) | Found the names of the permission and setting fields, listed in `reference/roles-matrix.md`. The API has no endpoint for listing assets. |
| 2026-11-07 | Re-read the create-asset spec | `POST` takes no body; the type schema has to come from an asset made in the UI. We postponed creating the welcome display rather than guess. |
| 2026-11-07 | Read Frame docs: Frame Home, Users & Permissions, AI Agents, v0.59 notes | Built the role matrix |
| 2026-11-07 | Joined as a guest from the agent's cloud browser; ran box diagnostics | 3D failed. No GPU and software WebGL; Chrome log: `fail_if_major_perf_caveat + software gl`; Frame fell back to 2D. Nothing created, nothing changed. |
