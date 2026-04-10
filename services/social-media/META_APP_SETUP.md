# Meta App Setup Guide

## Overview

This guide walks through creating a Meta Developer App and getting API credentials for the **Mitjavila Enterprise** Facebook page.

**Page Details:**
- Name: Mitjavila Enterprise
- Page ID: 61576463357319
- URL: https://www.facebook.com/profile.php?id=61576463357319

---

## Step 1: Create a Meta Developer Account

1. Go to **developers.facebook.com**
2. Click **Get Started** (top right)
3. Sign in with your Jose L. Mitjavila Facebook account
4. Accept the terms and complete verification (may require phone/email)

---

## Step 2: Create an App

1. Once logged in, go to **My Apps** (top right)
2. Click **Create App**
3. Choose **App Type:** Business
4. Fill in:
   - **App Name:** "Mitjavila Enterprise Social Media" (or similar)
   - **App Contact Email:** your email
   - **App Purpose:** Select "Manage and analyze business assets"
5. Click **Create App**
6. You'll be redirected to the **App Dashboard**

---

## Step 3: Add Facebook Product

1. In the left sidebar, scroll to **Add Products**
2. Find **Facebook** → click **Set Up**
3. Choose **Existing Facebook Page**
4. Select your page from the list: **Mitjavila Enterprise**
5. Click **Next**

---

## Step 4: Configure Permissions

The app needs these permissions to post and read engagement:

1. Under **Settings → Basic**, scroll down to **App Roles**
2. Make sure your account has at least **Admin** or **Developer** role
3. In the left sidebar, go to **Tools → Graph API Explorer**
4. At the top, select your app from the dropdown
5. Select your page from the **User or Page** dropdown (Mitjavila Enterprise)
6. Request the following permissions (you'll be prompted to grant them):
   - `pages_manage_posts` (ability to create posts)
   - `pages_read_engagement` (ability to read comments/likes)
   - `pages_read_metadata` (ability to read page info)

---

## Step 5: Generate Access Token

1. Go to **Settings → Basic** in your app dashboard
2. Scroll down to **App ID and App Secret**
   - Copy your **App ID**
   - Copy your **App Secret** (keep this private!)

3. Go to **Tools → Graph API Explorer**
4. In the dropdown at the top, select your app
5. In the **User or Page** dropdown, select **Mitjavila Enterprise**
6. Click **Generate Access Token**
7. You'll see a token appear — **copy this token** (this is your Page Access Token)

**Note:** This token lasts 60 days. You can generate a new one anytime from the Graph API Explorer.

---

## Step 6: Verify Permissions

To make sure everything is set up correctly, test the API:

1. Still in **Graph API Explorer**
2. Change the method from **GET** to **POST**
3. In the query field, enter: `me/feed`
4. In the body, add:
   ```
   {
     "message": "Test post from API"
   }
   ```
5. Click **Submit**

If it works, you'll see a post ID back. If it fails, check that:
- Your token has `pages_manage_posts` permission
- You're using the **Page** token (not the User token)
- The page is selected in the "User or Page" dropdown

---

## Step 7: Store Credentials Securely

Create a file: `.env.local` (in `/home/jose/.openclaw/workspace/services/social-media/`)

```
# Facebook / Meta API Credentials
# DO NOT commit this file to version control

FACEBOOK_PAGE_ID=61576463357319
FACEBOOK_PAGE_NAME=Mitjavila Enterprise
FACEBOOK_PAGE_ACCESS_TOKEN=<your-page-access-token-here>
FACEBOOK_APP_ID=<your-app-id>
FACEBOOK_APP_SECRET=<your-app-secret>
```

**Replace the values with your actual credentials.**

This file is gitignored and won't be committed to version control.

---

## Step 8: Test Posting via API

Once you have the credentials, you can test posting from the command line:

```bash
curl -X POST "https://graph.facebook.com/v19.0/61576463357319/feed" \
  -d "message=Hello from Mitjavila Enterprise API!" \
  -d "access_token=<your-page-access-token>"
```

Replace `<your-page-access-token>` with your actual token.

If successful, you'll see:
```json
{
  "id": "61576463357319_1234567890"
}
```

---

## Next Steps

- Use these credentials in the posting workflow
- Set up the posting template (spreadsheet or automation script)
- Begin scheduling posts for ME's account

---

**Credentials Stored:** `.env.local` (secure, not tracked)  
**Last Updated:** 2026-04-03
