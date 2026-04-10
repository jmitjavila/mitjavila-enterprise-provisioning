---
client: Mitjavila Enterprise
service: Social Media Management
status: active
owner: Jose L. Mitjavila
primary_contact: Jose Luis
timezone: America/Chicago
updated: 2026-04-10
---

# Mitjavila Enterprise — Client Setup

Client profile
- Internal/pilot customer for the Social Media Management service.
- Current focus is Facebook posting automation, with Instagram documentation ready alongside it.

Core service configuration

| Field | Value |
|-------|-------|
| Client | Mitjavila Enterprise |
| Service | Social Media Management |
| Owner | Jose L. Mitjavila |
| Primary Contact | Jose Luis (`jl.mitjavila`) |
| Timezone | America/Chicago |
| Facebook Page Name | Mitjavila Enterprise |
| Facebook Page ID | `1124882280698908` |
| Runtime Folder | `/home/jose/.openclaw/workspace/~/services/social-media/clients/mitjavila-enterprise/` |
| Posting Script | `post-to-facebook.sh` |
| Runtime Config | `.env.local` (private) |
| Scheduler | OpenClaw cron |

Workflow
- Content planning and publish history live in [[CONTENT_CALENDAR]].
- Scheduled run timing and cadence live in [[POSTING_SCHEDULE]].
- Engagement tracking lives in [[ENGAGEMENT_LOG]].
- Posting runs through `post-to-facebook.sh`, which sources `.env.local` on each execution.

Security
- Live Facebook or Instagram tokens are **not** stored in this vault note.
- Store live credentials only in `.env.local` or dedicated secrets storage.
- If a token is exposed, rotate it immediately in Meta and update `.env.local`.

Operational checklist
- [x] Client folder structure created
- [x] Facebook posting script documented
- [x] Content calendar documented
- [x] OpenClaw cron schedule created for the April campaign
- [ ] Confirm `.env.local` contains the current valid Facebook token after each rotation
- [ ] Keep [[CONTENT_CALENDAR]] updated with returned Facebook Post IDs
- [ ] Keep [[ENGAGEMENT_LOG]] updated with comments, messages, and follow-up notes

Related docs
- [[README]]
- [[CONTENT_CALENDAR]]
- [[POSTING_SCHEDULE]]
- [[ENGAGEMENT_LOG]]
- [[04-Services/social-media/SERVICE_SCHEMA]]
