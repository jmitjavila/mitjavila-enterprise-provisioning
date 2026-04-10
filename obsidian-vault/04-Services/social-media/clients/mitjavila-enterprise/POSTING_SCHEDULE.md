---
client: Mitjavila Enterprise
service: Social Media Management
platform: Facebook
status: scheduled
updated: 2026-04-10
---

# Mitjavila Enterprise — Automated Posting Schedule

Schedule summary
- Platform: Facebook
- Facebook Page ID: `1124882280698908`
- Status: OpenClaw cron automation active
- Cadence: Monday, Wednesday, Friday at 9:00 AM America/Chicago
- Runtime script: `/home/jose/.openclaw/workspace/~/services/social-media/clients/mitjavila-enterprise/post-to-facebook.sh`
- Runtime config: `.env.local` (loaded by the script at runtime)

Scheduled April 2026 posts

| Post | Topic | Date / Time | Status |
|------|-------|-------------|--------|
| 4 | Business Organization | 2026-04-11 09:00 CDT / 14:00 UTC | Scheduled |
| 5 | Why Businesses Choose Mitjavila | 2026-04-14 09:00 CDT / 14:00 UTC | Scheduled |
| 6 | Website Creation | 2026-04-16 09:00 CDT / 14:00 UTC | Scheduled |
| 7 | Homestead Monitoring | 2026-04-18 09:00 CDT / 14:00 UTC | Scheduled |
| 8 | The Mitjavila Process | 2026-04-21 09:00 CDT / 14:00 UTC | Scheduled |
| 9 | Strong Organization = Better Business | 2026-04-23 09:00 CDT / 14:00 UTC | Scheduled |
| 10 | What Makes Practical Different? | 2026-04-25 09:00 CDT / 14:00 UTC | Scheduled |
| 11 | April Reflection | 2026-04-28 09:00 CDT / 14:00 UTC | Scheduled |

Operational notes
- Each scheduled post is a one-shot OpenClaw cron job.
- Successful runs should update [[CONTENT_CALENDAR]] with the returned Facebook Post ID and mark the entry as published.
- If Meta token access changes, update `.env.local`. No service restart is required because the script sources the file on every run.
- If the Facebook API fails, do not mark the post as published; record the blocker in the calendar or engagement notes.

Related docs
- [[README]]
- [[CLIENT_SETUP]]
- [[CONTENT_CALENDAR]]
- [[ENGAGEMENT_LOG]]
