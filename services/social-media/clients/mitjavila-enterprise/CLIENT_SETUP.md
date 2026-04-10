# Mitjavila Enterprise — Client Setup Document

**Client Name:** Mitjavila Enterprise (ME)  
**Status:** Pilot / First Customer  
**Setup Date:** 2026-04-03  
**Service:** Social Media Management (Facebook + Instagram + LinkedIn in progress)

---

## Client Profile

| Field | Value |
|-------|-------|
| **Client Name** | Mitjavila Enterprise |
| **Account Owner** | Jose L. Mitjavila |
| **Primary Contact** | Jose Luis (jl.mitjavila) |
| **Timezone** | America/Chicago |
| **Service Tier** | Custom (Pilot) |

---

## LinkedIn Company Page Details

| Field | Value |
|-------|-------|
| **Company Page Name** | Mitjavila Enterprise |
| **LinkedIn Page URL** | [To be added] |
| **Organization URN** | [To be added] |
| **Primary Posting Mode** | Company Page |
| **Page Role Verified** | [Pending] |
| **Account Status** | 🚧 Setup in progress |

---

## Instagram Account Details

| Field | Value |
|-------|-------|
| **Account Name** | Mitjavila Enterprise |
| **Username** | jose.luis.mitjavila |
| **Account Type** | Business |
| **Account ID** | 966297459911400 |
| **Connected to Facebook Page** | Yes ✅ |
| **Account Status** | ✅ Active & Ready |

---

## Facebook Page Details

| Field | Value |
|-------|-------|
| **Page Name** | Mitjavila Enterprise |
| **Page ID** | 966297459911400 |
| **Page URL** | https://www.facebook.com/profile.php?id=61576463357319 |
| **Page Category** | Business |

---

## Instagram Posting Workflow

### Posting Script
```bash
cd /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/
bash post-to-instagram.sh "Your caption here"
```

### Example
```bash
bash post-to-instagram.sh "📱 Ready to grow your business? Let's talk about social media strategy. #MitjavilaEnterprise"
```

### Response
```
✅ Post published!
Post ID: 17841406XXXXXXXXXX_YYYYYY
Account: @jose.luis.mitjavila
Time: 2026-04-06 15:30:00 CDT
```

---

## LinkedIn Posting Workflow

### Posting Script
```bash
cd /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/
bash post-to-linkedin.sh "Your LinkedIn post text here"
```

### Example
```bash
bash post-to-linkedin.sh "We help businesses strengthen their digital presence with clearer systems, more consistent communication, and practical execution."
```

### Expected Response
```
✅ LinkedIn post published!
Post URN: urn:li:share:...
Author: urn:li:organization:...
Time: 2026-04-10 16:30:00 CDT
```

---

## API Credentials

⚠️ **IMPORTANT:** These credentials are sensitive. Store securely and never commit to version control.

[REDACTED - store live token only in .env.local]

### Meta App Details

| Field | Value |
|-------|-------|
| **App Name** | Mitjavila Enterprise Social Media |
| **App ID** | *[To be filled in]* |
| **App Secret** | *[To be filled in — store separately]* |
| **Developer Portal** | https://developers.facebook.com/apps/ |

### Page Access Token

```
[REDACTED - store live token only in .env.local]
```

**Token Permissions:**
- ✅ pages_manage_posts (create posts)
- ✅ pages_read_engagement (read comments/likes)
- ✅ pages_read_metadata (read page info)

**Token Expiration:** 60 days (regenerate as needed)  
**Last Generated:** [Date]  
**Last Rotated:** [Date]

---

## Posting Workflow

### Content Calendar

| Post # | Date | Image | Message Intent | Caption | Hashtags | Status |
|--------|------|-------|-----------------|---------|----------|--------|
| 1 | | | | | | Pending |
| 2 | | | | | | Pending |
| 3 | | | | | | Pending |

### Posting Log

| Date Posted | Post ID | Image | Caption | Reach | Engagement | Notes |
|-------------|---------|-------|---------|-------|------------|-------|
| | | | | | | |

---

## Engagement Monitoring

### Daily Check Log

| Date | Comments | Messages | Sentiment | Actions Taken | Notes |
|------|----------|----------|-----------|---------------|-------|
| | | | | | |

### Response Policy

- **Escalate:** Urgent questions, complaints, leads → Flag for Jose review
- **Auto-respond:** Generic thank-yous → Use pre-approved templates
- **Ignore:** Spam, off-topic

---

## Analytics & Reporting

### Monthly Report Schedule

| Month | Report Sent | Posts Published | Reach | Engagement | Follower Growth | Notes |
|-------|------------|-----------------|-------|------------|-----------------|-------|
| April 2026 | | | | | | Pilot month |
| | | | | | | |

---

## Service Configuration

### Posting Frequency
- **Cadence:** [To be determined with client]
- **Posts per Week:** [TBD]
- **Preferred Posting Times:** [TBD]
- **Content Types:** [Images + captions]

### Engagement Monitoring
- **Frequency:** Daily
- **Report Cadence:** Weekly or Monthly [TBD]
- **Response SLA:** [TBD]

### Analytics
- **Report Frequency:** Monthly
- **Delivery Format:** PDF (client-facing)
- **Key Metrics:** Reach, Engagement, Follower Growth, Top Post

---

## Onboarding Checklist

### Setup Phase
- [x] Create Facebook business page
- [x] Create Meta Developer App
- [x] Generate Page Access Token (page-specific token, not user token)
- [x] Set up client folder structure
- [x] Create posting script (post-to-facebook.sh)
- [x] Set up engagement monitoring template (ENGAGEMENT_LOG.md)
- [x] Test successful post (2026-04-03)
- [ ] Create LinkedIn Developer app
- [ ] Configure LinkedIn OAuth scopes and redirect URI
- [ ] Confirm company-page admin role + organization URN
- [ ] Add LinkedIn posting credentials to `.env.local`
- [ ] Test successful text-only LinkedIn post
- [ ] Define response policies with client
- [ ] Schedule first batch of posts

### Workflow Phase
- [ ] Receive first batch of images from client
- [ ] Create captions and schedule posts
- [ ] Begin daily engagement monitoring
- [ ] Generate first weekly report
- [ ] Collect feedback from client

### Optimization Phase (after 2-4 weeks)
- [ ] Review what's working
- [ ] Identify content patterns
- [ ] Adjust posting frequency/times if needed
- [ ] Document learnings for next client

---

## Tools & Resources

### Meta Developer Tools
- **Graph API Explorer:** https://developers.facebook.com/tools/explorer
- **App Dashboard:** https://developers.facebook.com/apps/
- **Documentation:** https://developers.facebook.com/docs/

### Posting & Scheduling
- **Manual API Posting:** curl + Page Access Token
- **Posting Script:** `post-to-facebook.sh` (ready to use)
- **Spreadsheet Tracker:** [Link to shared sheet]
- **Automation Script:** [Link if available]

### Reporting
- **Analytics Source:** Facebook Insights (built-in)
- **Engagement Log:** ENGAGEMENT_LOG.md (daily tracking)
- **Report Template:** [Link to template]

---

## Notes & Learnings

### Setup Observations
- *[Add notes as you go]*

### Client Feedback
- *[Add client notes here]*

### Improvements for Next Client
- *[Document what to change/improve]*

---

## Credentials Storage

⚠️ **DO NOT** commit this file with live tokens to version control.

**Secure Storage Method:**
1. This document: Keep in workspace (sensitive info redacted for version control)
2. Live credentials: Store in `.env.local` (gitignored)
3. Token rotation: Update monthly or as needed

**File Structure:**
```
/services/social-media/
├── SERVICE_SCHEMA.md (public)
├── META_APP_SETUP.md (public)
├── clients/
│   └── mitjavila-enterprise/
│       ├── CLIENT_SETUP.md (this file — shared, tokens redacted)
│       ├── .env.local (PRIVATE — not tracked)
│       ├── posting-calendar.csv
│       └── engagement-log.csv
```

---

**Document Version:** 1.2  
**Last Updated:** 2026-04-10  
**Status:** ✅ Facebook + Instagram active/ready, LinkedIn onboarding started
**Instagram Setup:** Complete — Credentials configured, posting script ready
**LinkedIn Setup:** In progress — company page details and OAuth still need to be completed
