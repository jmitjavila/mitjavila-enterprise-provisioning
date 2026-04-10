# Instagram Setup Playbook

**Version:** 1.0  
**Created:** 2026-04-06  
**Reference Customer:** Mitjavila Enterprise  
**Status:** Ready for Implementation

---

## Overview

This playbook documents the **exact steps** to set up Instagram API integration for a new client. Use this for repeatability and consistency.

**Time to completion:** ~45 minutes (most time is waiting for Instagram account conversion or Meta app review)

**Prerequisites:**
- Meta App already created for Facebook (reuse it)
- Facebook Business Page already created
- Client's personal Instagram account exists (can be converted)

---

## Phase 1: Client Instagram Account Prep (15 mins)

### Step 1.1 — Verify Instagram Account Exists

Ask the client:
- "Do you have an Instagram account for your business?"
- "Is it a **Business Account** or a **Personal Account**?"

**If Business Account exists:** Skip to Step 1.2  
**If Personal Account or Creator Account:** Go to Step 1.3  
**If no account:** Have them create one at instagram.com (takes 2-3 mins)

### Step 1.2 — Verify Connection to Facebook Page

1. Client logs into their **Instagram Business Account**
2. Go to **Settings → Linked Accounts**
3. Verify their **Facebook Business Page** is listed and connected
4. If not, tap **Link Facebook Page** and select the page

**Result:** Instagram account is now connected to Facebook page ✅

### Step 1.3 — Convert Account to Business Account (If Needed)

If the account is Personal or Creator:

1. Client logs into Instagram
2. Go to **Settings → Account Type**
3. Tap **"Switch to Professional Account"**
4. Choose **"Business"** (not Creator)
5. Fill in:
   - Business category (e.g., "Small Business")
   - Business name (match Facebook page name if possible)
   - Contact information (email or phone)
6. Tap **"Switch to Business Account"**
7. Go to **Settings → Linked Accounts → Link Facebook Page**
8. Select the Mitjavila Enterprise Facebook page
9. Confirm the link

**Result:** Account converted to Business Account and linked to Facebook page ✅

### Step 1.4 — Document Instagram Account Details

Create or update **CLIENT_SETUP.md** with Instagram info:

```markdown
## Instagram Account Details

| Field | Value |
|-------|-------|
| **Account Name** | Mitjavila Enterprise |
| **Username** | mitjavila_enterprise |
| **Account Type** | Business |
| **Business Category** | [Category] |
| **Connected to Facebook Page** | Yes ✅ |
| **Account ID** | [To be filled after API setup] |
```

---

## Phase 2: Meta App Configuration (20 mins)

### Step 2.1 — Add Instagram Product to Existing Meta App

You're reusing the Meta App created for Facebook. Now add Instagram:

1. Go to **developers.facebook.com → My Apps**
2. Open **Mitjavila Enterprise Social Media** app
3. In left sidebar, scroll to **Products**
4. Look for **Instagram** → Click **"Set Up"** (if not already added)
5. Choose **"Existing Instagram Business Account"**
6. Select **Mitjavila Enterprise** Instagram account from the list
7. Click **"Add"** or **"Next"**

**Result:** Instagram product added to app ✅

### Step 2.2 — Add Required Permissions

Instagram posting requires specific permissions. Add them:

1. Go to **Graph API Explorer** (developers.facebook.com/tools/explorer)
2. Top left dropdown: Select **Mitjavila Enterprise Social Media** app
3. In **User or Page** dropdown: Select your **Instagram Business Account**
4. Look for the **"Add a Permission"** button
5. Add these permissions one by one:
   - `instagram_basic` (read basic account info)
   - `instagram_content_publish` (post to feed, carousel, Reels)
   - `pages_read_engagement` (read comments/likes)
   - `instagram_insights` (optional: read detailed analytics)

6. Click **"Save"** or confirm

**Note:** When you add `instagram_content_publish`, Instagram may prompt you to authorize the app. Accept the prompt.

**Result:** All permissions granted ✅

### Step 2.3 — Generate Instagram Page Access Token

⚠️ **Important:** Use **Page Access Token**, not User Token.

1. In **Graph API Explorer**, make sure:
   - App is selected: **Mitjavila Enterprise Social Media**
   - Account is selected: **Your Instagram Business Account**
2. Click **"Generate Access Token"** (blue button, bottom)
3. Confirm permissions popup (should show instagram_content_publish, instagram_basic, etc.)
4. A token appears (starts with `IGE...` or `EAA...`)
5. **Copy this token** — you'll need it in Step 3.1

**Token Format:**
```
IGEAfx4Bzd6nWeZA2HHOP5LkxxxyyyyZZZZZ (long string)
```

**Token Lifespan:** ~60 days. Regenerate monthly for security.

**Result:** Token generated and copied ✅

---

## Phase 3: Credentials & Testing (10 mins)

### Step 3.1 — Get Instagram Business Account ID

You need your **Instagram Business Account ID** for API calls.

1. In **Graph API Explorer**, make sure Instagram account is selected
2. In the query field, type: `me`
3. Click **"Submit"** (GET method)
4. Look at the JSON response:
   ```json
   {
     "id": "17841406XXXXXXXXXX",
     "username": "mitjavila_enterprise",
     "name": "Mitjavila Enterprise"
   }
   ```
5. **Copy the `id` value** — this is your **Instagram Business Account ID**

**Result:** Account ID retrieved ✅

### Step 3.2 — Store Credentials in .env.local

Update or create `/services/social-media/clients/mitjavila-enterprise/.env.local`:

```bash
#!/bin/bash
# Mitjavila Enterprise — Instagram & Facebook Credentials
# ⚠️ DO NOT COMMIT THIS FILE

# Facebook
export FACEBOOK_PAGE_ID="966297459911400"
export FACEBOOK_PAGE_NAME="Mitjavila Enterprise"
export FACEBOOK_PAGE_ACCESS_TOKEN="EAAZAnZCWDp6BUBRB9eNGSy9coAhZCz1..."

# Instagram
export INSTAGRAM_BUSINESS_ACCOUNT_ID="17841406XXXXXXXXXX"
export INSTAGRAM_BUSINESS_ACCOUNT_NAME="mitjavila_enterprise"
export INSTAGRAM_PAGE_ACCESS_TOKEN="IGEAfx4Bzd6nWeZA2HHOP5Lk..."

# Meta App
export META_APP_ID="[your app id]"
export META_APP_SECRET="[store separately]"

# Note: Same person can manage both. Update token every 60 days.
export TOKEN_LAST_ROTATED="2026-04-06"
export TOKEN_EXPIRES="2026-06-05"
```

**File Security:**
- Never commit to git
- Store locally in client folder
- Add to `.gitignore`
- Update expiration date when regenerating

**Result:** Credentials stored securely ✅

### Step 3.3 — Test Instagram API Access

Run this test to verify the token works:

```bash
# Load credentials
source /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/.env.local

# Test 1: Read account info
curl -X GET "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}?fields=id,username,name,website,bio&access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}"
```

**Expected response:**
```json
{
  "id": "17841406XXXXXXXXXX",
  "username": "mitjavila_enterprise",
  "name": "Mitjavila Enterprise",
  "website": "https://mitjavila.net",
  "bio": "Your bio here"
}
```

If you see this → **Token works!** ✅

If you see an error like `"error":"(#200) Permissions error"`:
- Regenerate token from Graph API Explorer
- Confirm `instagram_content_publish` is added
- Try again

### Step 3.4 — Test Posting (Simple Image Post)

Ready for the real test? Post a test image:

**Prepare:**
1. Get a test image (JPG or PNG, at least 1080x1350 pixels for feed)
2. Upload it to a public URL (or use a placeholder URL)

**Post via API:**

```bash
# Load credentials
source /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/.env.local

# Step 1: Create a media container (upload stage)
CONTAINER_ID=$(curl -s -X POST "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media" \
  -d "image_url=https://example.com/test-image.jpg" \
  -d "caption=Test post from API 🎉" \
  -d "access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}" | jq -r '.id')

echo "Container ID: $CONTAINER_ID"

# Step 2: Publish the container (go live)
curl -X POST "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media_publish" \
  -d "creation_id=$CONTAINER_ID" \
  -d "access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}"
```

**Expected response:**
```json
{
  "id": "18012345678901234567890"
}
```

If you see a post ID → **Post successful!** ✅

**Verification:**
1. Go to Mitjavila Enterprise Instagram account
2. Check the feed for the new post
3. Should appear within 1-2 minutes

If post doesn't appear after 2 mins:
- Check Instagram app notifications for issues
- Verify post content (no banned hashtags, images, etc.)
- Check `instagram_content_publish` permission is active

### Step 3.5 — Test Reading Engagement

Can you read comments and likes?

```bash
# Load credentials
source /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/.env.local

# Get recent posts
curl -X GET "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media?fields=id,caption,media_type,timestamp,like_count,comments_count&access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}"
```

**Expected response:**
```json
{
  "data": [
    {
      "id": "18012345678901234567890",
      "caption": "Test post from API 🎉",
      "media_type": "IMAGE",
      "timestamp": "2026-04-06T15:30:00+0000",
      "like_count": 5,
      "comments_count": 2
    }
  ]
}
```

If you see this → **Engagement reading works!** ✅

---

## Phase 4: Client Documentation & Handoff (5 mins)

### Step 4.1 — Update CLIENT_SETUP.md

Add Instagram section to `/services/social-media/clients/mitjavila-enterprise/CLIENT_SETUP.md`:

```markdown
## Instagram Account Details

| Field | Value |
|-------|-------|
| **Account Name** | Mitjavila Enterprise |
| **Username** | mitjavila_enterprise |
| **Account ID** | 17841406XXXXXXXXXX |
| **Account Type** | Business |
| **Connected to Facebook** | Yes ✅ |

## Instagram API Credentials

| Field | Value |
|-------|-------|
| **Page Access Token** | IGEAfx4Bzd6nWeZA2HHOP5Lk... (see .env.local) |
| **Token Permissions** | instagram_basic, instagram_content_publish, pages_read_engagement |
| **Token Expiration** | 60 days |
| **Last Generated** | 2026-04-06 |
| **Last Rotated** | 2026-04-06 |

## Instagram Posting Workflow

- Single image posts (Feed): 200/day
- Carousel posts: 200/day
- Reels (video): 100/day
- Stories: 300/day
- **Burst limit:** Max 10 posts/hour (space them out!)

## Testing Status

- ✅ API access verified
- ✅ Test post successful
- ✅ Engagement reading works
- ✅ Ready for production
```

### Step 4.2 — Create Instagram Posting Script

Create `/services/social-media/clients/mitjavila-enterprise/post-to-instagram.sh`:

```bash
#!/bin/bash
# Mitjavila Enterprise — Post to Instagram via API
# Usage: bash post-to-instagram.sh "https://example.com/image.jpg" "Caption text here"

# Load credentials
source "$(dirname "$0")/.env.local"

# Check arguments
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <image_url> <caption>"
  echo "Example: $0 'https://example.com/photo.jpg' 'Hello Instagram! 🎉'"
  exit 1
fi

IMAGE_URL="$1"
CAPTION="$2"

echo "📸 Posting to Instagram..."
echo "Image: $IMAGE_URL"
echo "Caption: $CAPTION"

# Step 1: Create media container
echo "⏳ Uploading image..."
CONTAINER_ID=$(curl -s -X POST "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media" \
  -d "image_url=${IMAGE_URL}" \
  -d "caption=${CAPTION}" \
  -d "access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}" | jq -r '.id // .error.message')

if [ "$CONTAINER_ID" == "null" ] || [[ "$CONTAINER_ID" == *"error"* ]]; then
  echo "❌ Upload failed: $CONTAINER_ID"
  exit 1
fi

echo "✅ Container created: $CONTAINER_ID"

# Step 2: Publish
echo "⏳ Publishing..."
POST_ID=$(curl -s -X POST "https://graph.instagram.com/v19.0/${INSTAGRAM_BUSINESS_ACCOUNT_ID}/media_publish" \
  -d "creation_id=${CONTAINER_ID}" \
  -d "access_token=${INSTAGRAM_PAGE_ACCESS_TOKEN}" | jq -r '.id // .error.message')

if [ "$POST_ID" == "null" ] || [[ "$POST_ID" == *"error"* ]]; then
  echo "❌ Publish failed: $POST_ID"
  exit 1
fi

echo "✅ Post published successfully!"
echo "📱 Post ID: $POST_ID"
echo "🔗 View at: https://instagram.com/[username]/p/[shortcode]"
```

Make it executable:
```bash
chmod +x /services/social-media/clients/mitjavila-enterprise/post-to-instagram.sh
```

### Step 4.3 — Create Engagement Monitoring Template

Create or update `ENGAGEMENT_LOG.md`:

```markdown
# Mitjavila Enterprise — Instagram Engagement Log

## Daily Check Template

| Date | New Comments | New Messages | Sentiment | Actions Taken | Notes |
|------|-------------|--------------|-----------|---------------|-------|
| 2026-04-07 | 3 | 2 | Positive | Replied to all | Event inquiry x1 |
| | | | | | |

## Response Policy

- **Escalate:** Urgent questions, complaints, leads → Flag for Jose review
- **Auto-respond:** Generic thank-yous → Use pre-approved templates
- **Ignore:** Spam, off-topic comments

## Pre-Approved Responses

- **Thank you response:** "Thanks for the love! 🙌"
- **Event inquiry:** "Thanks for your interest! Please email [contact] for details."
- **Product question:** "Great question! Check our bio for more info."
```

### Step 4.4 — Send Client Handoff Email

Optional: Send client a summary:

```
Subject: ✅ Instagram API Setup Complete — Mitjavila Enterprise

Hi Jose,

Great news! Your Instagram account is now connected to our API and ready for automated posting.

**What's Set Up:**
✅ Instagram Business Account linked to Facebook page
✅ Meta App configured with posting permissions
✅ API credentials generated and tested
✅ Test post verified (visible on your Instagram feed)
✅ Engagement monitoring ready

**Next Steps:**
1. Provide images and captions for your content calendar
2. We'll post on the schedule you approve
3. Daily engagement monitoring will begin
4. First report in 1-2 weeks

**Security Note:**
Your API credentials are stored securely and rotated monthly. Never share them publicly.

Ready to go live! Let me know when you want to start the content calendar.

Best,
[Your name]
```

---

## Phase 5: Ongoing Maintenance (Monthly)

### Token Rotation

Every 60 days:

1. Go to **Graph API Explorer**
2. Select your app and Instagram account
3. Generate a new token
4. Update `.env.local` with the new token
5. Update `CLIENT_SETUP.md` with the new date
6. Delete the old token from Meta app settings (optional but recommended)

### Monitoring Posting Health

Weekly checklist:
- [ ] Check posting script works (no recent errors)
- [ ] Verify posts appear within 1-2 minutes of API call
- [ ] Monitor for rate limit errors (adjust posting frequency if needed)
- [ ] Review engagement logs for any issues

### Permission Audits

Every quarter:
- [ ] Verify `instagram_content_publish` permission still active
- [ ] Check for any Instagram API deprecations or changes
- [ ] Review rate limits against your posting volume

---

## Common Issues & Solutions

### Issue: "Invalid Instagram Account ID"

**Cause:** Using wrong ID (Facebook page ID instead of Instagram ID).

**Fix:**
1. Go to Graph API Explorer
2. Query `me` with Instagram account selected
3. Copy the `id` from response (not from URL)
4. Use that ID in all API calls

### Issue: "(#200) Permissions error"

**Cause:** Missing `instagram_content_publish` or token expired.

**Fix:**
1. Go to Graph API Explorer
2. Confirm `instagram_content_publish` is added
3. Re-generate token
4. Update `.env.local`
5. Test again

### Issue: Post Created But Won't Publish

**Cause:** Content violates Instagram guidelines, or account restrictions.

**Fix:**
- Check for banned hashtags, images, or words
- Verify image dimensions (1080x1350 for feed)
- Try posting a different image/caption
- If persistent, post manually via Instagram app to test

### Issue: Rate Limit Hit (Error #351065)

**Cause:** Posted more than 10/hour or 200/day.

**Fix:**
- Space posts out (max 10/hour)
- Wait 24 hours before posting again
- Check daily limit and reduce frequency if needed

### Issue: Token Keeps Expiring

**Cause:** Not rotating token monthly; Instagram invalidates old tokens.

**Fix:**
- Set calendar reminder to regenerate token every 60 days
- Automate token rotation if possible
- Keep `.env.local` updated

---

## Checklist for New Clients

When setting up a new client's Instagram:

- [ ] Collect Instagram account details from client
- [ ] Verify account is Business type (or convert it)
- [ ] Verify account is linked to Facebook page
- [ ] Add Instagram product to Meta App
- [ ] Add `instagram_content_publish` and other permissions
- [ ] Generate Instagram Page Access Token
- [ ] Get Instagram Business Account ID
- [ ] Store credentials in `.env.local` (with rotation date)
- [ ] Run API tests (read account, post image, read engagement)
- [ ] Create posting script for client
- [ ] Create engagement log template
- [ ] Update CLIENT_SETUP.md with Instagram details
- [ ] Send client handoff summary
- [ ] Schedule token rotation reminder (60 days out)

---

## Quick Reference: API Endpoints

### Post to Feed

```bash
# Step 1: Create container
POST /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media
  -d "image_url={URL}"
  -d "caption={TEXT}"
  -d "access_token={TOKEN}"
→ Returns: {"id": "CONTAINER_ID"}

# Step 2: Publish
POST /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media_publish
  -d "creation_id={CONTAINER_ID}"
  -d "access_token={TOKEN}"
→ Returns: {"id": "POST_ID"}
```

### Post Carousel

```bash
# Step 1: Create first image container
POST /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media
  -d "image_url={IMAGE_1_URL}"
  -d "access_token={TOKEN}"
→ Returns: {"id": "ITEM_1_ID"}

# Repeat for 2-10 images

# Step 2: Create carousel container
POST /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media
  -d "media_type=CAROUSEL"
  -d "children=[ITEM_1_ID,ITEM_2_ID,...]"
  -d "caption={TEXT}"
  -d "access_token={TOKEN}"
→ Returns: {"id": "CAROUSEL_CONTAINER_ID"}

# Step 3: Publish
POST /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media_publish
  -d "creation_id={CAROUSEL_CONTAINER_ID}"
  -d "access_token={TOKEN}"
→ Returns: {"id": "POST_ID"}
```

### Read Recent Posts

```bash
GET /v19.0/{INSTAGRAM_BUSINESS_ACCOUNT_ID}/media
  ?fields=id,caption,media_type,timestamp,like_count,comments_count
  &access_token={TOKEN}
```

### Read Post Insights

```bash
GET /v19.0/{POST_ID}/insights
  ?metric=impressions,engagement,reach,video_views
  &access_token={TOKEN}
```

---

**Playbook Version:** 1.0  
**Last Updated:** 2026-04-06  
**Status:** Tested & Ready
