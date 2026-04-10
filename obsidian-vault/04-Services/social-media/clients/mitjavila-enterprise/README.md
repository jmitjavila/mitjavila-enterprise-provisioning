---
client: Mitjavila Enterprise
service: Social Media Management
status: active
platforms:
  - Facebook
  - Instagram
updated: 2026-04-10
---

# Mitjavila Enterprise — Social Media Management

Service snapshot
- Pilot/internal client for the Social Media Management service.
- Facebook posting automation is active via OpenClaw cron.
- Instagram docs and scripts exist in the runtime folder and can be activated as needed.

Operational layout
- Vault hub: [[03-Clients/Mitjavila-Enterprise]]
- Service schema: [[04-Services/social-media/SERVICE_SCHEMA]]
- Client setup: [[CLIENT_SETUP]]
- Content calendar: [[CONTENT_CALENDAR]]
- Posting schedule: [[POSTING_SCHEDULE]]
- Engagement log: [[ENGAGEMENT_LOG]]
- Runtime folder: `/home/jose/.openclaw/workspace/~/services/social-media/clients/mitjavila-enterprise/`
- Posting script: `post-to-facebook.sh`
- Runtime config: `.env.local` (private, not stored in the vault)

Live configuration
- Facebook Page Name: Mitjavila Enterprise
- Facebook Page ID: `1124882280698908`
- Scheduler: OpenClaw cron jobs
- Cadence: Monday, Wednesday, Friday at 9:00 AM America/Chicago (14:00 UTC during the April 2026 schedule)

Automation notes
- Scheduled Facebook posts are created as one-shot cron jobs and call `post-to-facebook.sh`.
- The posting script sources `.env.local` at runtime, so token rotations should be updated there.
- Current campaign details live in [[CONTENT_CALENDAR]] and [[POSTING_SCHEDULE]].
- Successful runs should record the returned Facebook Post ID in the content calendar.

Security rules
- Never store live Meta access tokens in vault notes.
- Keep secrets only in `.env.local` or dedicated secret storage.
- If a token is exposed, rotate it immediately and update `.env.local`.

Related docs
- [[04-Services/social-media/README]]
- [[04-Services/social-media/META_APP_SETUP]]
- [[04-Services/social-media/SETUP_PLAYBOOK]]
- [[04-Services/social-media/FACEBOOK_SETUP_PLAYBOOK_PROVEN]]
