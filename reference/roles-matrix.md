# Roles and permissions: admin compared with visitors

Key: **API-verified** means we saw it in a read-only API response. **Documented** means Frame's docs say it. **Untested** means we haven't tried it.

## Roles
| Role | What it can do | Evidence |
|---|---|---|
| Owner (creator) | Everything. Adds admins and decides whether admins can add other admins. Deletes the Frame, which also cancels its subscription. | Documented ([Frame Home](https://learn.framevr.io/tutorials/frame-home), [Users & Permissions](https://learn.framevr.io/tutorials/users-permissions)) |
| Admin | Settings, analytics, environments, logos and user permissions. Can mute everyone, clear chat, remove users, use web browsers. With the right settings, gets the same options as the owner. | Documented |
| Member | Joins the Frame; gets whatever permissions the admin grants | Documented |
| Guest | Joins without signing up (an email can be required); limited by default | Documented ([v0.59 notes](https://learn.framevr.io/blog/frame-update-v059)) |

The API's `permissions` schema uses four levels: `guest`, `user`, `member`, `admin`. **API-verified (spec)**

## Settings an admin can open up to visitors
Each is a `*PermissionLevel` field on the Frame. **API-verified:** the fields exist and can be read. We changed none of them.

| Permission | What it lets a visitor do (documented) |
|---|---|
| edit | Add, change or delete assets, change scenes, share a webcam or screen |
| interact | Click content, turn PDF pages, expand photospheres, play and pause media |
| view | Enter the Frame, chat, create an avatar, move around |
| mic / camera | Speak; share a webcam or screen |
| photosphere, emoji, laser pointer, flat mode | The matching in-world tools |
| zone lock | Lock private voice zones |
| streaming | Share a screen without full interaction rights |
| moderation | Moderation options in the People menu, such as freezing users |
| panel | Add wall-panel content without full edit rights |
| transcription, calendar invite | The matching features |

Other switches an admin controls (they exist as API fields; descriptions are documented): allow guests, require guest email, password, allow remix, admins can invite admins, members can invite, chat and private chat on/off, games, fly mode, voice zones.

## AI agents by role (documented, [AI Agents](https://learn.framevr.io/tutorials/ai-agents))
- **Guests:** chat only
- **Members:** chat, voice, and pre-loaded knowledge
- **Admins:** all of that, plus uploading new knowledge

## What the API can do (admin key)
Read and update settings, manage members and admins, create, read, update and delete assets, and switch scenes. **Documented in the spec.** We have only tested reads.

**Permissions changed by this project: none.**

## Observed in the browser (signed in, flat mode, 7 Nov 2026)
Frame Settings showed Permissions, Environment, Branding (marked Pro), Action Editor, Clone and Roles. The Assets list showed Text Label, Text Area, Polls and more. Seeing admin-style controls is evidence of what we can access; it doesn't confirm our role, because the role label wasn't shown.
