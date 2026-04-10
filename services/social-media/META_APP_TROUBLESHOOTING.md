# Meta App Troubleshooting Guide

**Issue:** Getting error #200 when trying to post to page, even with correct permissions selected.

---

## Checklist: App Configuration

### 1. App Roles & Admin Permissions

Go to: **developers.facebook.com/apps** → Your App → **Roles**

- [ ] Is your account listed as an **Admin** on the app?
- [ ] If not, add yourself with Admin role

### 2. App Review & Permissions

Go to: **developers.facebook.com/apps** → Your App → **Settings → Basic**

Check if these permissions are **approved**:
- [ ] `pages_manage_posts` — approved?
- [ ] `pages_read_engagement` — approved?
- [ ] `pages_manage_metadata` (or similar) — approved?

**Note:** Some permissions require app review. If they show "In Review" or "Not Approved", they won't work yet.

### 3. App Type

Go to: **Settings → Basic**

Check:
- [ ] Is your app type set to **Business** or **Social Media Tool**?
- [ ] NOT a **Personal Use App** (these have limited permissions)

### 4. Page Access

Go to: **Your App → Products → Facebook Login → Settings**

Check:
- [ ] Is the page listed under "Authorized Domains" or "Redirect URIs"?
- [ ] Are the correct OAuth redirect URIs configured?

### 5. Generate Fresh Token with Full Permissions

1. Go to **Graph API Explorer**
2. **DO NOT** click "Generate Access Token" — instead:
3. Click the **access token dropdown** (top area where token is shown)
4. Click **"Get Page Access Token"** specifically
5. Select your page: **Mitjavila Enterprise**
6. Confirm all requested permissions (should include pages_manage_posts, pages_read_engagement)
7. Copy the token

---

## Alternative: Use Facebook's Native Scheduler

If the API continues to have issues, Facebook's built-in scheduler might work better for a pilot:

1. Go to your page
2. Click **Create** button (top left)
3. Write your post
4. Click **Schedule** (instead of Publish)
5. Pick a date/time
6. Done

This bypasses the API entirely and proves your page can post. Once that works, we know the issue is API-specific.

---

## Questions to Ask

1. When you generated the page token, did it ask for permissions? (If not, regenerate)
2. Is your Meta app currently in "Development" mode or "Live"?
3. Does the app have any restrictions or review pending?

---

## Next Steps

Check items 1-5 above and report back. We'll adjust the approach based on what you find.
