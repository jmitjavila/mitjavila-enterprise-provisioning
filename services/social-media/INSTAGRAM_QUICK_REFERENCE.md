# Instagram Quick Reference Card

**Print this or pin it for easy access while setting up or posting.**

---

## Setup Checklist (One-Time)

- [ ] Instagram account is Business type (Settings → Account Type)
- [ ] Instagram linked to Facebook page (Instagram Settings → Linked Accounts)
- [ ] Instagram product added to Meta App (developers.facebook.com)
- [ ] `instagram_content_publish` permission added
- [ ] Instagram Page Access Token generated
- [ ] Instagram Business Account ID retrieved
- [ ] Credentials stored in `.env.local`
- [ ] API test successful (read account info)
- [ ] Test post published successfully
- [ ] Engagement reading verified (can see comments/likes)

---

## Posting Quick Guide

### Image Specs
- **Dimension:** 1080 × 1350 px (4:5 ratio)
- **Format:** JPG or PNG
- **Size:** Under 8 MB
- **Quality:** High (no compression artifacts)

### Caption Formula
1. **Hook** (1-2 sentences) — Start with emotion, question, or benefit
2. **Body** (2-3 sentences) — Educate, inspire, or entertain
3. **CTA** (1 sentence) — Ask question, encourage save/DM, or link
4. **Hashtags** (20-30) — Mix niche/popular/branded

**Example:**
```
🎯 Your business deserves better

Most entrepreneurs are leaving money on the table because 
they haven't locked in their systems yet.

We've helped 50+ clients scale to 7 figures. Here's what 
we learned along the way.

What's your biggest scaling challenge? 👇

#SmallBusiness #Growth #Entrepreneurship #BusinessStrategy
```

### Posting Frequency
- **Target:** 3-4 posts/week
- **Types:** 2-3 single images, 1 carousel, optional Reel or Stories
- **Schedule:** Mon 9 AM, Wed 12:30 PM, Fri 5 PM (adjust per Insights)

### Rate Limits
- **Feed posts:** 200/day (unlimited practical)
- **Reels:** 100/day
- **Burst limit:** Max 10 posts/hour (space them out!)

---

## Content Types at a Glance

| Type | Frequency | Time | Spec | Duration |
|------|-----------|------|------|----------|
| **Feed Image** | 2-3x/wk | Mon/Wed/Fri | 1080×1350px | N/A |
| **Carousel** | 1x/wk | Wed | 1080×1350px each (3-10 images) | N/A |
| **Reel** | 1-2x/mo | Any | 1080×1920px | 30-60 sec |
| **Story** | 2-3x/wk | Anytime | 1080×1920px | Auto 5-15 sec |

---

## Caption Checklist (Before Posting)

- [ ] 100-150 words (feed) or 150-200 (carousel)
- [ ] Hook in first 1-2 lines
- [ ] Body has clear value/emotion
- [ ] CTA is specific (comment, save, DM, etc.)
- [ ] Hashtags are 20-30 total
- [ ] No typos or grammar errors
- [ ] Emojis used sparingly (1-3 max)
- [ ] Line breaks for readability

---

## Hashtag Mix

**Total: 20-30 hashtags**

| Type | Count | Example |
|------|-------|---------|
| Branded | 2-3 | #MitjavilaEnterprise |
| Niche (5K-50K) | 5-7 | #SmallBusiness |
| Popular (100K+) | 3-5 | #SmallBiz |
| Long-tail | 3-5 | #SmallBusinessOwner |

**Placement:** Below CTA, not in caption

---

## Engagement Daily Checklist

**Morning (9-10 AM):**
- [ ] Check new comments on recent posts
- [ ] Reply to meaningful comments (personalize)
- [ ] Check DMs for questions
- [ ] Like/comment on 10-15 similar accounts

**Midday (12-1 PM):**
- [ ] Check Instagram Insights
- [ ] Engage with 5-10 peer posts

**Evening (5-6 PM):**
- [ ] Check for urgent messages
- [ ] Quick DM responses

---

## Monthly Review

| Metric | Target | How to Check |
|--------|--------|--------------|
| **Reach** | +5-10% week-over-week | Instagram Insights → Posts |
| **Engagement** | 3-5% rate | Likes + comments / reach |
| **Saves** | High | Insights → Post performance |
| **Followers** | +10-20/month | Insights → Overview |

**Action:** Identify top 3 posts, note what worked, adjust next month.

---

## API Commands

### Test Account Access
```bash
curl -X GET "https://graph.instagram.com/v19.0/{ACCOUNT_ID}?fields=id,username,name&access_token={TOKEN}"
```

### Post Image (2-step process)

**Step 1: Create container**
```bash
curl -X POST "https://graph.instagram.com/v19.0/{ACCOUNT_ID}/media" \
  -d "image_url={URL}" \
  -d "caption={TEXT}" \
  -d "access_token={TOKEN}"
→ Returns: {"id": "CONTAINER_ID"}
```

**Step 2: Publish**
```bash
curl -X POST "https://graph.instagram.com/v19.0/{ACCOUNT_ID}/media_publish" \
  -d "creation_id={CONTAINER_ID}" \
  -d "access_token={TOKEN}"
→ Returns: {"id": "POST_ID"}
```

### Read Recent Posts
```bash
curl -X GET "https://graph.instagram.com/v19.0/{ACCOUNT_ID}/media?fields=id,caption,timestamp,like_count,comments_count&access_token={TOKEN}"
```

---

## Common Errors

| Error | Cause | Fix |
|-------|-------|-----|
| **(#200) Permissions error** | Missing `instagram_content_publish` | Re-generate token from Graph API Explorer |
| **Invalid account ID** | Using Facebook page ID instead of IG ID | Get ID from `me` query in Graph API Explorer |
| **Image not found** | URL not publicly accessible | Use CDN-hosted image or public URL |
| **Rate limit (351065)** | Posted >10/hour or >200/day | Wait 1 hour, space posts out |
| **Post won't publish** | Content violates guidelines | Check for banned hashtags, try different image |

---

## Content Ideas (Rotating Themes)

✅ **Always works:**
- Business tips + actionable advice
- Customer testimonials
- Team/culture moments
- Educational carousels (how-tos)
- Motivational/inspirational quotes
- Behind-the-scenes (process, office, team)

❌ **Avoid:**
- Generic stock photos
- Engagement pods or fake engagement
- Controversial topics
- Overly self-promotional (every other post)
- Long paragraphs without breaks
- Banned hashtags (#follow, #like, etc.)

---

## Credential Template

**Store in `.env.local` (never commit to git):**

```bash
export INSTAGRAM_BUSINESS_ACCOUNT_ID="17841406..."
export INSTAGRAM_BUSINESS_ACCOUNT_NAME="mitjavila_enterprise"
export INSTAGRAM_PAGE_ACCESS_TOKEN="IGEAfx4Bzd6nWeZA2..."
export TOKEN_LAST_ROTATED="2026-04-06"
export TOKEN_EXPIRES="2026-06-05"
```

---

## Token Rotation

**Every 60 days:**
1. Go to Graph API Explorer (developers.facebook.com/tools/explorer)
2. Select app + Instagram account
3. Click "Generate Access Token"
4. Copy new token
5. Update `.env.local`
6. Update CLIENT_SETUP.md with new date
7. Test API call to verify

---

## Links

- **Graph API Explorer:** https://developers.facebook.com/tools/explorer
- **Instagram API Docs:** https://developers.facebook.com/docs/instagram-api
- **App Dashboard:** https://developers.facebook.com/apps/
- **Meta Developer:** https://developers.facebook.com

---

## Need Help?

- **Setup questions:** See INSTAGRAM_API_SETUP.md
- **Posting errors:** See INSTAGRAM_SETUP_PLAYBOOK.md (Phase 4, Common Issues)
- **Content strategy:** See INSTAGRAM_CONTENT_STRATEGY.md
- **Client onboarding:** See INSTAGRAM_SETUP_PLAYBOOK.md
- **This card:** Reference anytime while posting/monitoring

---

**Quick Reference v1.0 | 2026-04-06 | Ready to Print & Use**
