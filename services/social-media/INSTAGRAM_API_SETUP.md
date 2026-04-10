# Instagram Graph API Setup Guide

## Overview

This guide walks through setting up the Instagram Graph API for **Mitjavila Enterprise** (or any business client). The good news: **you can reuse the Meta App you created for Facebook**. Instagram integration happens within the same Meta ecosystem.

**Key Difference from Facebook:**
- Instagram requires a **Business Account** (not a personal Creator account)
- Uses the same Meta App but adds Instagram permissions
- Different token types and endpoints than Facebook
- Rate limits are more restrictive

---

## Prerequisites

✅ Meta Developer Account (already created for Facebook)  
✅ Meta App for Mitjavila Enterprise (already created)  
✅ Facebook Business Page for ME (already created)  
✅ Instagram Business Account connected to the Facebook page (we'll verify/create this)

---

## Step 1: Verify Instagram Business Account

Instagram accounts must be **Business Accounts** (not Personal or Creator) to use the API.

### Option A: Account Already Exists (Recommended)

1. Go to **Instagram.com** and log in with the account you want to use
2. Go to **Settings → Account Type**
3. Verify it says **"Business Account"**
4. If it says **"Creator Account"**, skip to **Option B**

**Note:** The Instagram account should ideally be the same account owner as your Facebook page.

### Option B: Convert to Business Account

If your account is Personal or Creator:

1. On Instagram, go to **Settings → Account Type**
2. Tap **"Switch to Professional Account"**
3. Choose **"Business"** (not Creator)
4. Complete the setup (add business category, contact info)
5. Confirm it's now a Business Account

---

## Step 2: Connect Instagram to Meta App

Now that you have a Business Account, link it to your Meta App.

1. Go to **developers.facebook.com** → **My Apps**
2. Open your **Mitjavila Enterprise Social Media** app
3. In the left sidebar, look for **"Add Products"**
4. Find **Instagram** → click **"Set Up"** (if not already added)
5. Choose **"Existing Instagram Business Account"**
6. Select your **Mitjavila Enterprise Instagram Business Account** from the list
7. Click **"Next"**

**If your account doesn't appear:**
- Verify the Instagram account is connected to your Facebook page
- Go to Instagram Settings → Linked Accounts → Link Facebook Page
- Retry the setup

---

## Step 3: Configure Instagram Permissions

The Instagram Graph API needs these permissions to post and read insights:

### Required Permissions

1. ✅ **instagram_basic** — Read basic account info
2. ✅ **instagram_content_publish** — Publish posts (photos, carousels, Reels)
3. ✅ **pages_read_engagement** — Read comments and likes (shared with Facebook)
4. ✅ **pages_read_metadata** — Read page metadata (shared with Facebook)

### Optional Permissions

- **instagram_manage_messages** — Respond to DMs (if handling customer support)
- **instagram_insights** — Read detailed analytics (if generating reports)

### How to Add Permissions

1. Go to **developers.facebook.com/tools/explorer** (Graph API Explorer)
2. Top left: Select your **Mitjavila Enterprise Social Media** app
3. In the **User or Page** dropdown, select your **Instagram Business Account**
4. Look for the **"Add a Permission"** button (usually below the query field)
5. Search for and add each permission from the list above
6. Click **"Save"** or confirm the request

**Note:** You may need to re-authorize your account to grant these permissions.

---

## Step 4: Generate Instagram Access Token

⚠️ **CRITICAL:** Always use **Page Access Token** (not User Token or Business Token).

### Generate via Graph API Explorer (Easiest)

1. Go to **developers.facebook.com/tools/explorer**
2. Top left: Select your **Mitjavila Enterprise Social Media** app
3. In **User or Page** dropdown, select your **Instagram Business Account**
4. Click **"Generate Access Token"** (blue button)
5. Confirm permissions (should include instagram_content_publish, instagram_basic, etc.)
6. A token appears (starts with "IGEA..." or "EAA...")
7. **Copy this token** — you'll use it for all Instagram API calls

**Token Format:**
```
IGEAfx4Bzd6nWeZA2HHOP5Lk... (long string, ~200+ characters)
```

### Generate via curl (Advanced)

If you prefer the command line:

```bash
curl -X GET "https://graph.instagram.com/v19.0/me?fields=id,username,name&access_token=YOUR_TOKEN"
```

Replace `YOUR_TOKEN` with your Page Access Token. Should return your Instagram account details.

---

## Step 5: Get Instagram Business Account ID

You need your **Instagram Business Account ID** to post and read insights.

### Method 1: Graph API Explorer (Easiest)

1. Go to **Graph API Explorer**
2. Select your app and Instagram account (from previous step)
3. In the query field, type: `me`
4. Click **"Submit"**
5. You'll see JSON like:
   ```json
   {
     "id": "17841406...",
     "username": "mitjavila_enterprise",
     "name": "Mitjavila Enterprise"
   }
   ```
6. **Copy the `id` value** — this is your **Instagram Business Account ID**

### Method 2: From URL

1. Go to your Instagram Business Account
2. Look at the URL or click **Edit Profile**
3. The profile ID may be visible in settings

---

## Step 6: Understand Token Types

### Page Access Token (What You Need)

- **Scope:** Pages you administer + their associated Instagram accounts
- **Lifetime:** ~60 days (can be refreshed)
- **Use for:** Posting, reading engagement, accessing insights
- **Security:** Store securely, rotate monthly
- **Example:** Starts with `EAA...` or `IGEA...`

### User Token (Don't Use)

- Expires after ~2 hours if user is not active
- Not suitable for long-term automation
- Avoid for posting workflows

### App Token (Don't Use)

- Limited permissions for security
- Not recommended for Instagram posting

**Bottom line:** Always use **Page Access Token**.

---

## Step 7: Test API Access

### Test 1: Read Account Info

```bash
curl -X GET "https://graph.instagram.com/v19.0/YOUR_INSTAGRAM_BUSINESS_ACCOUNT_ID?fields=id,username,name,website,bio,profile_picture_url&access_token=YOUR_TOKEN"
```

Replace:
- `YOUR_INSTAGRAM_BUSINESS_ACCOUNT_ID` with your IG account ID from Step 5
- `YOUR_TOKEN` with your Page Access Token

**Expected response:**
```json
{
  "id": "17841406...",
  "username": "mitjavila_enterprise",
  "name": "Mitjavila Enterprise",
  "website": "https://mitjavila.net",
  "bio": "Your bio here",
  "profile_picture_url": "https://..."
}
```

If you get an error like `"error":"(#200) Permissions error"`, the token is missing Instagram permissions. Re-generate the token from Graph API Explorer after confirming permissions are added.

### Test 2: Read Recent Posts

```bash
curl -X GET "https://graph.instagram.com/v19.0/YOUR_INSTAGRAM_BUSINESS_ACCOUNT_ID/media?fields=id,caption,media_type,timestamp&access_token=YOUR_TOKEN"
```

Should return a list of recent posts with IDs and captions.

### Test 3: Read Insights (Optional)

```bash
curl -X GET "https://graph.instagram.com/v19.0/YOUR_INSTAGRAM_BUSINESS_ACCOUNT_ID/insights?metric=impressions,engagement,profile_views&period=day&access_token=YOUR_TOKEN"
```

Should return account-level insights if `instagram_insights` permission is added.

---

## Step 8: Store Credentials Securely

Create or update `.env.local` in `/services/social-media/clients/mitjavila-enterprise/`:

```bash
#!/bin/bash
# Mitjavila Enterprise — Instagram & Facebook API Credentials
# ⚠️ DO NOT COMMIT THIS FILE

# Facebook
export FACEBOOK_PAGE_ID="966297459911400"
export FACEBOOK_PAGE_NAME="Mitjavila Enterprise"
export FACEBOOK_PAGE_ACCESS_TOKEN="EAAZAnZCWDp6BUBRB9eNGSy9..."

# Instagram
export INSTAGRAM_BUSINESS_ACCOUNT_ID="17841406..."
export INSTAGRAM_BUSINESS_ACCOUNT_NAME="mitjavila_enterprise"
export INSTAGRAM_PAGE_ACCESS_TOKEN="IGEAfx4Bzd6nWeZA2HHOP5Lk..."

# Meta App
export META_APP_ID="[your app id]"
export META_APP_SECRET="[store separately]"

# Note: Both FACEBOOK and INSTAGRAM can use the SAME Page Access Token
# But store separately for clarity in your code
```

**File Security:**
- Add to `.gitignore` (never commit)
- Store locally in client folder only
- Rotate tokens monthly
- Update `CLIENT_SETUP.md` with token refresh date

---

## Step 9: Understand Rate Limits

Instagram API rate limits are **per-account** and vary by action:

### Posting Rate Limits

| Action | Limit | Notes |
|--------|-------|-------|
| **Feed Posts** | 200 / day | Single image or carousel |
| **Reels** | 100 / day | Video uploads |
| **Stories** | 300 / day | Temporary stories |
| **Comments** | 300 / day | Replies to comments |

**Burst Limit:** No more than **10 posts per hour**. Space them out!

### Reading Rate Limits

| Action | Limit | Notes |
|--------|-------|-------|
| **API Calls (general)** | 200 / hour | Insights, media list, etc. |
| **Comment Reads** | Unlimited | Read-only, not rate-limited |

### Strategy

✅ **Do:**
- Space posts throughout the day
- Batch API reads (one call for multiple insights)
- Cache results when possible (don't call every minute)

❌ **Don't:**
- Post more than 10/hour
- Make redundant API calls
- Poll insights constantly

---

## Step 10: Common Errors & Fixes

### Error: "(#200) Permissions error"

**Cause:** Token missing required permissions.

**Fix:**
1. Go to Graph API Explorer
2. Confirm `instagram_content_publish` permission is added
3. Re-generate token from Instagram account dropdown
4. Update `.env.local` with new token
5. Retry API call

### Error: "Invalid Instagram account ID"

**Cause:** Using wrong account ID (Facebook page ID instead of Instagram IG account ID).

**Fix:**
1. Go to Graph API Explorer
2. Query: `me` (GET) with Instagram account selected
3. Copy the `id` field from response
4. Use that ID in API calls, not the Facebook page ID

### Error: "User must grant instagram_content_publish permission first"

**Cause:** Account hasn't authorized the `instagram_content_publish` permission yet.

**Fix:**
1. Go to developers.facebook.com
2. In your app, add `instagram_content_publish` permission
3. Re-authorize via Graph API Explorer
4. Generate a new token
5. Retry posting

### Error: "Application request limit reached"

**Cause:** Hit rate limit (either burst or daily).

**Fix:**
- Wait before making more API calls
- Respect the rate limits table from Step 9
- Space posts at least 6 minutes apart

### Error: "Instagram account not connected to this app"

**Cause:** Instagram account not properly linked to Meta App.

**Fix:**
1. Go to Instagram → Settings → Linked Accounts
2. Verify Facebook page is linked
3. Go back to developers.facebook.com
4. In app settings, re-add Instagram product
5. Select the account again and verify connection

---

## Next Steps

1. ✅ Store credentials in `.env.local` (from Step 8)
2. ✅ Run test API calls (from Step 7)
3. ✅ Verify posting works (see INSTAGRAM_SETUP_PLAYBOOK.md)
4. ✅ Update CLIENT_SETUP.md with Instagram details
5. ✅ Start posting! (see INSTAGRAM_CONTENT_STRATEGY.md)

---

## Useful Links

- **Graph API Explorer:** https://developers.facebook.com/tools/explorer
- **Instagram API Docs:** https://developers.facebook.com/docs/instagram-api
- **Instagram API Reference:** https://developers.facebook.com/docs/instagram-api/reference
- **App Dashboard:** https://developers.facebook.com/apps/

---

**Guide Version:** 1.0  
**Created:** 2026-04-06  
**Status:** Ready for Implementation
