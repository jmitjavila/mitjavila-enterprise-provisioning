# Social Media Management — Setup Playbook

**Version:** 1.0  
**Created:** 2026-04-03  
**Pilot Customer:** Mitjavila Enterprise  
**Status:** Tested & Validated

---

## Overview

This playbook documents the **exact steps** to set up Facebook Social Media Management for a new client. Follow this for repeatability.

**Time to completion:** ~1-2 hours (most time is waiting for Meta app review/permissions)

---

## Phase 1: Client & Page Setup (30 mins)

### Step 1.1 — Get Client Information

From the client, collect:
- **Primary contact name & email**
- **Facebook personal account** they'll use for the business page
- **Business/brand name** (for the page name)
- **Timezone** (for scheduling posts)
- **Target posting frequency** (posts/week)
- **Preferred posting times** (e.g., 9 AM on weekdays)

### Step 1.2 — Create Facebook Business Page

Have the **client** do this (you cannot do it for them):

1. Log into their personal Facebook account
2. Go to **facebook.com/pages/create**
3. Fill in:
   - **Page Name:** Business/brand name
   - **Category:** Business (NOT personal profile)
   - **Description:** Brief business description
   - **Profile Picture:** Logo (optional for now)
   - **Cover Photo:** Banner (optional for now)
4. Click **Create**
5. **Client provides you:** Page name, Page URL, Page ID

**Getting the Page ID:**
- Go to page settings → look in the URL or use Graph API Explorer query `me/accounts`
- Format: Usually 10-15 digits (e.g., `966297459911400`)

### Step 1.3 — Document Client Details

Create a **CLIENT_SETUP.md** in the client folder (copy from template):

```
/services/social-media/clients/[client-name]/
├── CLIENT_SETUP.md (fill in Page Name, Page ID, Page URL)
├── ENGAGEMENT_LOG.md (template, ready to use)
├── post-to-facebook.sh (script, ready to use)
├── .env.local (will fill with credentials)
└── posting-calendar.csv (create for first posts)
```

---

## Phase 2: Meta Developer App Setup (45 mins)

### Step 2.1 — Create Meta Developer Account

**Client or YOU** can do this:

1. Go to **developers.facebook.com**
2. Click **Get Started**
3. Sign in with the **same Facebook account** that owns the business page
4. Accept terms & complete verification (email/phone)

### Step 2.2 — Create a Meta App

1. Go to **My Apps** (top right)
2. Click **Create App**
3. Choose **App Type: Business**
4. Fill in:
   - **App Name:** e.g., "[Client Name] Social Media" (e.g., "Mitjavila Enterprise Social Media")
   - **App Contact Email:** Your email or client's email
   - **App Purpose:** "Manage and analyze business assets"
5. Click **Create App**

### Step 2.3 — Add Facebook Product

1. In the app dashboard, look for **Add Products** (left sidebar)
2. Find **Facebook** → click **Set Up**
3. Choose **Existing Facebook Page**
4. Select the client's page from the list
5. Click **Next**

### Step 2.4 — Configure App Permissions

The app needs **these specific permissions** to post:

- ✅ **pages_manage_posts** ← CRITICAL for posting
- ✅ **pages_read_engagement** ← For monitoring comments/likes
- ✅ **pages_read_metadata** ← For reading page info
- ✅ **pages_show_list** ← For listing pages
- Optional: ads_management, business_management (if client wants analytics)

**How to add permissions:**

1. Go to **Graph API Explorer** (developers.facebook.com/tools/explorer)
2. Make sure your app is selected (top left dropdown)
3. Make sure the **client's page** is selected in "User or Page" dropdown
4. Under the query field, look for **"Add a Permission"** button
5. Search for each permission above and add them
6. Click **Save** or confirm

---

## Phase 3: Generate & Store Credentials (30 mins)

### Step 3.1 — Generate Page Access Token

⚠️ **CRITICAL:** Use **page token**, not **user token**.

1. Go to **Graph API Explorer** (developers.facebook.com/tools/explorer)
2. Top left: Select your **app**
3. In the "User or Page" dropdown, look for **"Page Access Tokens"** section
4. Click on the **client's page name** (e.g., "Mitjavila Enterprise")
5. Click **"Generate Access Token"** (blue button, bottom)
6. Confirm permissions popup (should show all permissions you added)
7. A token appears (long string starting with "EAA...")
8. **Copy this token**

**Token Format:**
```
EAAZAnZCWDp6BUBRxxx... (long string, ~200+ characters)
```

**⚠️ Important Notes:**
- Tokens expire after ~60 days
- Store securely (see next step)
- Never share in public channels
- Regenerate monthly for security

### Step 3.2 — Store Credentials Securely

Create `.env.local` in the client folder (example):

```bash
#!/bin/bash
# [Client Name] — Facebook API Credentials
# ⚠️ DO NOT COMMIT THIS FILE

export FACEBOOK_PAGE_ID="[facebook page id]"
export FACEBOOK_PAGE_NAME="[client page name]"
export FACEBOOK_PAGE_ACCESS_TOKEN="[facebook page access token]"
export FACEBOOK_APP_ID="[your app id]"
export FACEBOOK_APP_SECRET="[store separately, never in code]"
```

**File Security:**
- Add to `.gitignore` (never commit)
- Store in client folder locally only
- Rotate token monthly
- Update CLIENT_SETUP.md with token refresh date

### Step 3.3 — Update CLIENT_SETUP.md

In the **API Credentials** section, fill in:
- **Page ID**
- **Page Name**
- **App Name**
- **Token permissions** (list what's enabled)
- **Token expiration date** (today + 60 days)
- **Last generated date**

---

## Phase 4: Test & Validate (15 mins)

### Step 4.1 — Test via Graph API Explorer

1. Go to **Graph API Explorer**
2. Select your app & page
3. In the query field, type: `me`
4. Click **Submit**
5. ✅ Should show page details (id, name, category, etc.)

If **error:** Token is invalid or permissions missing → regenerate.

### Step 4.2 — Test Posting

1. In Graph API Explorer, change method to **POST** (top left)
2. Query field: `[page-id]/feed` (replace with actual page ID)
3. In **Body** section, add:
   ```
   message=Test post from API
   ```
4. Click **Submit**
5. ✅ Should get a **Post ID** back

If **error #200:** Missing `pages_manage_posts` permission → add it and regenerate token.

### Step 4.3 — Verify Post on Facebook

1. Go to client's Facebook page
2. Look for the test post (should appear at top of feed)
3. ✅ If visible, posting works

If **not visible:** Check page's recent posts or post edit history.

---

## Phase 5: Automation & Monitoring Setup (30 mins)

### Step 5.1 — Set Up Posting Script

Copy **post-to-facebook.sh** to client folder. Usage:

```bash
cd /services/social-media/clients/[client-name]/
bash post-to-facebook.sh "Your message here"
```

This script:
- Reads credentials from `.env.local`
- Posts to the Facebook page via API
- Returns post ID if successful
- Reports errors if API fails

### Step 5.2 — Create Content Calendar

Create a **posting-calendar.csv** for tracking:

```csv
Date,Time,Content Type,Message,Hashtags,Post ID,Reach,Engagement,Status
2026-04-10,9:00 AM,Text,"Welcome post","#Business #Innovation",966297459911400_122103410684882111,150,25,Published
```

Or use a shared spreadsheet (Google Sheets) that client + you both access.

### Step 5.3 — Set Up Engagement Monitoring

Use the provided **ENGAGEMENT_LOG.md** template:

- Check page daily for:
  - Comments on posts
  - Direct messages
  - New followers
  - Engagement sentiment (positive/negative/neutral)
- Log responses & actions taken
- Flag urgent items (complaints, leads) for client review

---

## Phase 6: Reporting & Optimization (Weekly/Monthly)

### Step 6.1 — Pull Analytics from Facebook Insights

1. Go to client's page → **Insights** (left sidebar)
2. Check:
   - **Posts:** Reach, impressions, engagement
   - **Followers:** Growth rate
   - **Top performing post:** Which content resonates
   - **Peak times:** When audience is most active

### Step 6.2 — Generate Client Report

**Weekly Report (if daily monitoring):**
- Posts published: X
- Total reach: X
- Engagement rate: X%
- Top post: [name/link]
- Upcoming content: [next 3-5 posts planned]

**Monthly Report (summary):**
- Month overview (reach, engagement, follower growth)
- Top 3 posts by engagement
- Insights & recommendations
- Content suggestions for next month

Deliver as **PDF** to client (use Google Docs → export as PDF).

### Step 6.3 — Optimize Content

After 2-4 weeks, review:
- What post types work best? (text, image, video, polls)
- What topics get most engagement?
- Best posting times?
- Optimal posting frequency?

Adjust strategy based on data.

---

## Common Pitfalls & Fixes

### Issue: "Error #200 — Insufficient Permissions"

**Cause:** Missing `pages_manage_posts` permission or using user token instead of page token.

**Fix:**
1. Go to Graph API Explorer
2. Add `pages_manage_posts` permission
3. Regenerate token **from Page Access Tokens section** (not general Generate)
4. Retry posting

### Issue: "Page ID Not Allowed for This Call"

**Cause:** Using wrong page ID (URL ID vs. actual page ID).

**Fix:**
1. Go to Graph API Explorer
2. Query: `me/accounts` (GET)
3. Find your page in results, copy the `id` field
4. Use that ID in API calls, not the URL ID

### Issue: Token Expires or Stops Working

**Cause:** Page tokens expire after ~60 days or permissions revoked.

**Fix:**
1. Go to Graph API Explorer
2. Regenerate a fresh token (same process as before)
3. Update `.env.local` with new token
4. Update CLIENT_SETUP.md with new date
5. Test posting to confirm it works

### Issue: Post Not Showing on Page

**Cause:** API says successful but post invisible on Facebook.

**Possible reasons:**
- Page settings restrict posting (check page settings)
- Post violates Facebook community standards (inappropriate content)
- Temporary API lag (wait 5-10 mins, refresh page)

**Fix:**
1. Check Facebook page settings for restrictions
2. Verify post content (no violence, hate speech, spam)
3. Check post history/review queue
4. If persistent, test via native Facebook composer (Create button) to isolate API vs. account issue

---

## Files Checklist

For each new client, create:

```
/services/social-media/clients/[client-name]/
├── CLIENT_SETUP.md ✅ (copy from template, fill in details)
├── ENGAGEMENT_LOG.md ✅ (copy, ready to use)
├── post-to-facebook.sh ✅ (copy, ready to use)
├── .env.local ✅ (create with credentials)
├── posting-calendar.csv ✅ (create for tracking posts)
└── [optional] README.md (client-specific notes)
```

---

## Quick Reference: API Endpoints

**Post to page:**
```bash
POST /v19.0/{PAGE_ID}/feed
  -d "message=Your text"
  -d "access_token={TOKEN}"
```

**Get page info:**
```bash
GET /v19.0/{PAGE_ID}?access_token={TOKEN}
```

**Get page insights:**
```bash
GET /v19.0/{PAGE_ID}/insights
  ?metric=page_fans,page_impressions,page_engaged_users
  &access_token={TOKEN}
```

**Get comments on post:**
```bash
GET /v19.0/{POST_ID}/comments?access_token={TOKEN}
```

---

## Timeline Summary

| Phase | Task | Duration | Owner |
|-------|------|----------|-------|
| 1 | Client info + page creation | 30 min | Client + You |
| 2 | Meta app setup | 45 min | You |
| 3 | Credentials & token | 30 min | You |
| 4 | Test & validate | 15 min | You |
| 5 | Automation setup | 30 min | You |
| 6 | Reporting structure | 15 min | You |
| **Total** | | **~3 hours** | |

---

## Next Client Checklist

When setting up a new client:

- [ ] Collect client info (name, email, timezone, posting frequency)
- [ ] Create/verify Facebook business page
- [ ] Create Meta Developer App
- [ ] Add all permissions (especially `pages_manage_posts`)
- [ ] Generate page access token (from Page Access Tokens section)
- [ ] Create client folder & files (CLIENT_SETUP.md, .env.local, etc.)
- [ ] Test posting via API
- [ ] Verify post appears on Facebook
- [ ] Set up engagement monitoring
- [ ] Create first content calendar with client
- [ ] Document learnings for next iteration

---

**Document Version:** 1.0  
**Last Updated:** 2026-04-03  
**Playbook Status:** Validated (tested with Mitjavila Enterprise)
