# Facebook Setup Playbook — Proven Process

**Version:** 1.0 (Based on Mitjavila Enterprise successful setup)  
**Status:** Production-ready  
**Last Updated:** 2026-04-08

---

## Overview

This playbook documents the **exact steps that worked** to set up Facebook API posting for Mitjavila Enterprise. Use this for every new client to ensure consistent, reliable setup.

**Time to completion:** ~45 minutes  
**Prerequisites:** Client Facebook business page already exists

---

## Phase 1: Create/Verify Facebook Business Page (15 mins)

### Step 1.1 — Verify Page Exists
Ask the client:
- "Do you have a Facebook business page for [Business Name]?"
- "Can you log in and access it?"

If not, create one at facebook.com/pages/creation/

### Step 1.2 — Get Page ID
1. Client logs into their Facebook business page
2. Go to **Settings → Basic**
3. Look for **"Page ID"** (usually near the top)
4. Copy this ID (e.g., `1124882280698908`)
5. **Document this ID** — you'll need it later

**Example:** `1124882280698908`

### Step 1.3 — Document Page Details
Create a client file: `/services/social-media/clients/[CLIENT_NAME]/CLIENT_SETUP.md`

Record:
```markdown
## Facebook Page Details

| Field | Value |
|-------|-------|
| **Page Name** | [Client Business Name] |
| **Page ID** | [e.g., 1124882280698908] |
| **Page URL** | https://www.facebook.com/[page-id] |
| **Page Category** | [e.g., Business, Service, Product] |
| **Owner** | [Client name] |
```

---

## Phase 2: Meta App Setup (15 mins)

### Step 2.1 — Verify Meta App Exists
Go to **https://developers.facebook.com/apps**

Look for an existing app (or create new if needed):
- **Mitjavila Enterprise Social Media** — if this one is available, reuse it
- Otherwise, create a new app: **Settings → Create App → Business**

### Step 2.2 — Add Page to Meta App (Ensure Page Connection)

**CRITICAL: This is the step we missed initially and had to fix later.**

1. Go to **https://business.facebook.com** (Facebook Business Manager)
2. In left sidebar, find **Pages**
3. Click on the **client's business page**
4. Go to **Integrations → Connected Apps**
5. If empty, click **"go to Business Integrations"** link
6. Find your Meta app in the list
7. Click **"View and edit"**
8. **CHECK the box next to the client's page**
9. Click **"Save"**

**Result:** App is now authorized to access the client's page ✅

### Step 2.3 — Verify Permissions in Meta App
1. Go to **https://developers.facebook.com/apps**
2. Open your Meta app
3. Go to **Settings → Permissions**
4. Verify these permissions are present:
   - ✅ `pages_manage_posts` (create posts)
   - ✅ `pages_read_engagement` (read comments/likes)
   - ✅ `pages_read_metadata` (read page info)

If any are missing, add them now.

---

## Phase 3: Generate Page Access Token (10 mins)

### Step 3.1 — Generate Fresh Token

**CRITICAL: Must use PAGE token, not USER token. Page tokens last 60 days.**

1. Go to **https://developers.facebook.com/tools/explorer**
2. Top left dropdown: Select your **Meta App**
3. Look at the **"User or Page"** dropdown on the right
4. **IMPORTANT:** Select the **PAGE** (not the User/Personal account)
5. Verify it shows **"Mitjavila Enterprise"** or **[CLIENT_NAME]** page
6. Click blue **"Generate Access Token"** button
7. A token appears in the "Access Token" field at the top

**Token format:**
```
EAA...[page-access-token-redacted]
```

### Step 3.2 — Store Token Securely

Create/update this file: `~/.openclaw/workspace/.secrets/facebook-token-[CLIENT].txt`

**Example:** `~/.openclaw/workspace/.secrets/facebook-token-mitjavila.txt`

Paste the complete token (no line breaks):
```
EAA...[page-access-token-redacted]
```

### Step 3.3 — Verify Token Works

Test the token with a simple API call:
```bash
TOKEN="[paste-token-here]"
PAGE_ID="[paste-page-id-here]"

curl -X GET "https://graph.facebook.com/v19.0/${PAGE_ID}?fields=id,name&access_token=${TOKEN}"
```

Expected response:
```json
{
  "id": "1124882280698908",
  "name": "Mitjavila Enterprise"
}
```

If you get an error, the token has incorrect permissions or the page isn't connected to the app. Go back to Phase 2, Step 2.2 and reconnect.

---

## Phase 4: Configure Client Credentials File (5 mins)

### Step 4.1 — Create .env.local

File: `/services/social-media/clients/[CLIENT_NAME]/.env.local`

**Template:**
```bash
#!/bin/bash
# [CLIENT_NAME] — Facebook API Credentials
# ⚠️ DO NOT COMMIT THIS FILE
# This file is gitignored for security

# Facebook
export FACEBOOK_PAGE_ID="[facebook-page-id]"
export FACEBOOK_PAGE_NAME="[client-page-name]"
export FACEBOOK_PAGE_ACCESS_TOKEN="[facebook-page-access-token]"

# Token Management
export FACEBOOK_TOKEN_LAST_ROTATED="2026-04-08"
export FACEBOOK_TOKEN_EXPIRES="2026-06-07" # Long-lived page token, ~60 days
```

**Critical fields:**
- **FACEBOOK_PAGE_ID:** From Step 1.2 (with leading "1" if present)
- **FACEBOOK_PAGE_NAME:** Client's business name
- **FACEBOOK_PAGE_ACCESS_TOKEN:** From Step 3.1
- **FACEBOOK_TOKEN_EXPIRES:** +60 days from today

### Step 4.2 — Verify .gitignore

Make sure `.env.local` is in your `.gitignore`:

```bash
# In /services/social-media/clients/[CLIENT_NAME]/.gitignore
.env.local
.env.*.local
*.token
```

---

## Phase 5: Test Posting (5 mins)

### Step 5.1 — Test with Simple Post

```bash
cd /home/jose/.openclaw/workspace/services/social-media/clients/[CLIENT_NAME]/
bash post-to-facebook.sh "🧪 Testing Facebook API connection for [CLIENT_NAME]. This is a test post."
```

### Step 5.2 — Verify Success

Expected output:
```
✅ Post successful!
Post ID: 1124882280698908_122101492550813214
URL: https://www.facebook.com/1124882280698908_122101492550813214
```

If error, troubleshoot:

| Error | Fix |
|-------|-----|
| "Insufficient permission to post" | Go back to Phase 2, Step 2.2 and verify app is connected to page |
| "Invalid OAuth access token" | Token expired; regenerate from Phase 3, Step 3.1 |
| "Object does not exist" | Wrong Page ID in .env.local; verify in Phase 1, Step 1.2 |
| "Session has expired" | User token, not page token; regenerate as Page token in Phase 3 |

---

## Phase 6: Set Up Posting Automation (Optional)

### Step 6.1 — Create Content Calendar

If posting regularly, create: `/services/social-media/clients/[CLIENT_NAME]/POSTING_SCHEDULE.md`

Document:
- Post dates/times
- Message content
- Images
- Hashtags

### Step 6.2 — Schedule with Cron (if needed)

For automated posting, create cron jobs:
```bash
cron add \
  --name "[CLIENT] - Weekly Post" \
  --schedule "cron:0 9 * * 1" \
  --message "Post this to [CLIENT] Facebook page: [message here]"
```

---

## Troubleshooting Checklist

**Before troubleshooting, verify in order:**

1. ✅ Page exists and client can access it
2. ✅ Page ID is correct (Phase 1, Step 1.2)
3. ✅ Meta app is connected to page (Phase 2, Step 2.2) — **THIS IS CRITICAL**
4. ✅ Token is PAGE token, not USER token (Phase 3, Step 3.1)
5. ✅ Token is fresh and not expired (regenerate if >1 week old)
6. ✅ Page ID in .env.local matches actual page ID (Phase 4, Step 4.1)
7. ✅ Token in .env.local is complete (no truncation)

**Most common issue:** App not connected to page (Phase 2, Step 2.2). If posting fails, this is the first thing to check.

---

## Quick Reference for Future Clients

**For each new client:**

1. Get their **Page ID** → Store in CLIENT_SETUP.md
2. **Connect app to their page** → Via Business Manager (Phase 2, Step 2.2)
3. Generate **Page Access Token** → From Graph API Explorer (Phase 3, Step 3.1)
4. **Update .env.local** → With Page ID + Token (Phase 4)
5. **Test posting** → With simple test message (Phase 5)
6. **Set up schedule** → If needed (Phase 6)

---

## Token Rotation Policy

**Every 60 days:** Regenerate token to ensure freshness

1. Go to **https://developers.facebook.com/tools/explorer**
2. Select Meta App + Client Page
3. Generate new token
4. Update `.env.local` with new token
5. Update `FACEBOOK_TOKEN_LAST_ROTATED` date
6. Test posting once
7. Archive old token (keep for records)

---

## What We Learned (Post-Setup)

### Critical Steps (Don't Skip)
- **Phase 2, Step 2.2** — Connecting app to page is ESSENTIAL. This caused our first failure on Apr 7.
- **Phase 3, Step 3.1** — MUST select PAGE in dropdown, not User. User tokens expire after hours.
- **Phase 4, Step 4.1** — Page ID format matters. Include leading "1" if present (e.g., `1124882280698908` not `124882280698908`)

### Common Mistakes
- ❌ Using User token instead of Page token (expires same day)
- ❌ Forgetting to connect app to page in Business Manager
- ❌ Copying token from wrong place (use Graph API Explorer, not app settings)
- ❌ Wrong Page ID format (missing leading "1")

### Best Practices
- ✅ Store tokens in separate file (`.secrets/facebook-token-[client].txt`)
- ✅ Test immediately after setup
- ✅ Regenerate tokens every 60 days
- ✅ Document everything in CLIENT_SETUP.md

---

**Document Version:** 1.0  
**Last Validated:** 2026-04-08 (Mitjavila Enterprise)  
**Status:** Production-ready for all new clients
