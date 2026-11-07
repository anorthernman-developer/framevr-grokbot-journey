# Frame VR × Grok Bot: a build journey

A public log of what one person (Craig Stanley) and an AI agent (Grok Bot) can do with a Frame subscription and the Frame REST API: building spaces, shaping environments and wiring in integrations.

- **Blog:** https://anorthernman-developer.github.io/framevr-grokbot-journey/ (source in [`docs/`](docs/))
- **Gist:** https://gist.github.com/anorthernman-developer/e21049559b46869af6e3e8a47f776cdf
- **Methods log:** [`METHODS.md`](METHODS.md), every tool and call we used
- **Capabilities and limits:** [`reference/capabilities.md`](reference/capabilities.md)
- **Frame OpenAPI spec (public, v0.66.3):** [`reference/frame-openapi-0.66.3.json`](reference/frame-openapi-0.66.3.json)
- **Roles matrix:** [`reference/roles-matrix.md`](reference/roles-matrix.md)
- **Welcome display plan and undo:** [`reference/welcome-display-plan.md`](reference/welcome-display-plan.md)
- **Roadmap:** [`ROADMAP.md`](ROADMAP.md)
- **Example:** [`examples/read-frame.sh`](examples/read-frame.sh), read-only; the key is never passed as a command-line argument

## Ground rules
- No API keys in this repo. Keys live in `FRAME_API_KEY` (see `.env.example`).
- We only publish settings and status codes, never private space content or member emails.
- Each claim is marked **Confirmed** (from Frame's docs or a test we ran) or **Proposed** (an idea we haven't tested yet).
