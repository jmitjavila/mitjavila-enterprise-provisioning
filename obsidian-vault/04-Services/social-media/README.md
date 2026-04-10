# Social Media Management Service — Complete Guide

**Status:** Facebook (Active), Instagram (Ready to Deploy)  
**Pilot Customer:** Mitjavila Enterprise  
**Last Updated:** 2026-04-06

---

## Active clients

- [[clients/mitjavila-enterprise/README|Mitjavila Enterprise]] — internal pilot client for Facebook posting automation, content calendar management, and engagement tracking

## 📚 Documentation Overview

This folder contains everything needed to run a social media management service for small businesses. All materials are production-ready and client-facing.

### Core Documents

| Document | Purpose | Audience | Status |
|----------|---------|----------|--------|
| **SERVICE_SCHEMA.md** | Service offering, tiers, workflow | Management, sales | ✅ Active |
| **META_APP_SETUP.md** | Facebook Graph API setup | Developers, setup person | ✅ Active |
| **SETUP_PLAYBOOK.md** | Facebook client onboarding playbook | Implementation team | ✅ Active |
| **INSTAGRAM_API_SETUP.md** | Instagram Graph API setup | Developers, setup person | ✅ Ready |
| **INSTAGRAM_SETUP_PLAYBOOK.md** | Instagram client onboarding playbook | Implementation team | ✅ Ready |
| **INSTAGRAM_CONTENT_STRATEGY.md** | Content strategy for Instagram | Content creators, clients | ✅ Ready |
| **INSTAGRAM_QUICK_REFERENCE.md** | Quick reference card (printable) | Daily use | ✅ Ready |
| **INSTAGRAM_DEPLOYMENT_SUMMARY.md** | What was created & how to use it | Jose, decision makers | ✅ Ready |

---

## 🚀 Quick Start

### For Setup (First Time Only)

**Facebook (Already Done):**
1. Read: META_APP_SETUP.md
2. Follow: SETUP_PLAYBOOK.md
3. Result: Posting script + credentials stored

**Instagram (Next):**
1. Read: INSTAGRAM_API_SETUP.md (30 min)
2. Follow: INSTAGRAM_SETUP_PLAYBOOK.md (1 hour)
3. Test: Run API tests from Step 3.3
4. Result: Same as Facebook — ready to post

### For Posting (Daily/Weekly)

**Before Every Post:**
1. Check INSTAGRAM_QUICK_REFERENCE.md for image specs + caption formula
2. Use INSTAGRAM_CONTENT_STRATEGY.md for ideas + best practices
3. Verify checklist (image size, caption format, hashtags)
4. Post via API or native Instagram app
5. Log in ENGAGEMENT_LOG.md

**Daily Engagement:**
1. 9 AM: Check comments, reply, check DMs
2. 12 PM: Check Insights, engage with peers
3. 5 PM: Check for urgent messages

**Monthly:**
1. Pull Instagram Insights
2. Review reach, engagement, top posts
3. Identify what worked, plan adjustments
4. Generate client report

---

## 📋 File Structure

```
/services/social-media/
│
├── README.md (this file — orientation guide)
├── SERVICE_SCHEMA.md (main service offering, both platforms)
│
├── FACEBOOK MATERIALS
├── META_APP_SETUP.md (Facebook API setup)
├── SETUP_PLAYBOOK.md (Facebook onboarding)
│
├── INSTAGRAM MATERIALS
├── INSTAGRAM_API_SETUP.md (Instagram API setup)
├── INSTAGRAM_SETUP_PLAYBOOK.md (Instagram onboarding)
├── INSTAGRAM_CONTENT_STRATEGY.md (Instagram strategy)
├── INSTAGRAM_QUICK_REFERENCE.md (printable cheat sheet)
├── INSTAGRAM_DEPLOYMENT_SUMMARY.md (what was created)
│
├── META_APP_TROUBLESHOOTING.md (shared troubleshooting)
│
└── clients/
    └── mitjavila-enterprise/
        ├── CLIENT_SETUP.md (client profile + credentials)
        ├── .env.local (PRIVATE: credentials)
        ├── ENGAGEMENT_LOG.md (daily engagement tracking)
        ├── CONTENT_CALENDAR.md (posting schedule)
        ├── POSTING_SCHEDULE.md (timing & frequency)
        ├── post-to-facebook.sh (Facebook posting script)
        ├── post-to-instagram.sh (Instagram posting script)
        └── [other client-specific files]
```

---

## 🎯 Use Cases

### I want to set up a new client

**Steps:**
1. Choose Facebook, Instagram, or both (SERVICE_SCHEMA.md explains tiers)
2. For Facebook: Follow SETUP_PLAYBOOK.md
3. For Instagram: Follow INSTAGRAM_SETUP_PLAYBOOK.md
4. Both together: Do Facebook first, then Instagram (reuses same Meta App)

**Time:** 2-3 hours end-to-end (including waiting for API permissions)

### I want to post to Instagram

**Steps:**
1. Check INSTAGRAM_QUICK_REFERENCE.md for image specs (1080×1350px)
2. Use INSTAGRAM_CONTENT_STRATEGY.md for caption formula
3. Create image + write caption + add hashtags (20-30)
4. Use posting script: `bash post-to-instagram.sh "URL" "Caption"`
5. Verify post appears within 1-2 minutes
6. Log in ENGAGEMENT_LOG.md

**Time:** 5-10 minutes per post

### I want to monitor engagement

**Steps:**
1. Daily (9 AM, 12 PM, 5 PM): Check comments/DMs (INSTAGRAM_QUICK_REFERENCE.md daily checklist)
2. Respond to meaningful comments (template in ENGAGEMENT_LOG.md)
3. Log engagement metrics
4. Monthly: Generate report (INSTAGRAM_CONTENT_STRATEGY.md Part 8)

**Time:** 10-15 minutes daily, 1 hour monthly

### I want to improve content performance

**Steps:**
1. After 4 weeks: Pull Instagram Insights (reach, engagement, saves)
2. Review top 3 posts (what worked?)
3. Check INSTAGRAM_CONTENT_STRATEGY.md trends (what to avoid?)
4. Adjust next month's calendar based on data
5. Document learnings for next client

**Time:** 30 minutes monthly

### I need help with an API error

**Steps:**
1. Check INSTAGRAM_SETUP_PLAYBOOK.md "Common Issues & Solutions" (Phase 4)
2. Or INSTAGRAM_API_SETUP.md "Step 10: Common Errors & Fixes"
3. Or META_APP_TROUBLESHOOTING.md (shared across both platforms)
4. If still stuck: Contact Meta Support with exact error message

**Time:** 5-15 minutes

---

## 🔑 Key Concepts

### Page Access Token (What We Use)

- **Scope:** Manage pages you administer + their Instagram accounts
- **Lifetime:** ~60 days
- **Use for:** Posting, reading engagement, accessing insights
- **Storage:** `.env.local` (secure, never shared)
- **Rotation:** Monthly (regenerate, update credentials)

### Instagram Business Account (What You Need)

- **Type:** Business Account (not Personal or Creator)
- **Link:** Connected to Facebook Business Page
- **API Access:** Via Meta App (same app as Facebook)
- **Credentials:** Account ID + Page Access Token

### Rate Limits (Don't Hit Them)

- **Feed posts:** 200/day (not limiting)
- **Reels:** 100/day
- **Burst:** Max 10 posts/hour (space them out!)
- **API calls:** 200/hour (batch reads when possible)

---

## 📊 Metrics That Matter

### Monthly Tracking

| Metric | Target | Where to Check |
|--------|--------|----------------|
| **Posts published** | 12-16 (3-4x/week) | Content Calendar |
| **Reach** | +5-10% vs. prior month | Instagram Insights |
| **Engagement rate** | 3-5% | Reach ÷ Engagement |
| **Saves** | High = valuable content | Post performance |
| **Follower growth** | +10-20 net new | Insights → Overview |
| **Top post** | Identify type/topic | Insights → Posts |

**Action:** Use monthly report to adjust strategy.

---

## ⚙️ Maintenance Calendar

### Daily
- [ ] Monitor comments/DMs (9 AM, 12 PM, 5 PM)
- [ ] Respond to engagement
- [ ] Log in ENGAGEMENT_LOG.md

### Weekly
- [ ] Post 3-4x per week (Mon/Wed/Fri + optional)
- [ ] Engage with 10-15 peer accounts
- [ ] Check API health (no recent errors)

### Monthly
- [ ] Pull Instagram Insights
- [ ] Generate client report
- [ ] Review what worked, adjust next month
- [ ] (Plan token rotation if 60+ days)

### Every 60 Days
- [ ] Regenerate Page Access Token
- [ ] Update `.env.local` with new token
- [ ] Update CLIENT_SETUP.md with new date
- [ ] Test API call to verify token works

---

## 🛡️ Security Checklist

- [ ] API credentials stored in `.env.local` (not committed to git)
- [ ] `.env.local` added to `.gitignore`
- [ ] Credentials never shared in Slack/email
- [ ] Page Access Token rotated every 60 days
- [ ] Old tokens deleted from Meta App settings
- [ ] CLIENT_SETUP.md version control tracked (without live tokens)
- [ ] Meta App access limited to authorized team only

---

## 🤝 Platform Differences

### Facebook vs. Instagram

| Aspect | Facebook | Instagram |
|--------|----------|-----------|
| **Primary audience** | Family, broad | Visual, entrepreneurs |
| **Caption style** | 150-250 words, friendly | 100-150 words, punchy |
| **Content type** | Text + images + links | Visual-first, video-heavy |
| **Hashtags** | 3-5 (optional) | 20-30 (critical for reach) |
| **Best engagement** | Educational, personal | Motivational, carousels, Reels |
| **Posting frequency** | 2-4x/week | 3-4x/week |

**Strategy:** Different platforms = different voice, but same core message.

---

## 📞 Support & Troubleshooting

### Common Questions

**Q: Can I use the same image for Facebook and Instagram?**  
A: Different aspect ratios. Facebook: 1200×628px. Instagram: 1080×1350px. Create platform-specific versions.

**Q: What if my token expires?**  
A: Regenerate from Graph API Explorer. Same process as original generation. Update `.env.local` and test.

**Q: How fast will followers grow?**  
A: Depends on content quality and engagement. Realistic: +10-50/month for new accounts. Focus on engagement rate, not follower count.

**Q: Can I schedule posts in advance?**  
A: Meta API supports scheduled posts. Future feature — currently posting same-day.

**Q: What if a post violates Instagram guidelines?**  
A: Instagram will reject it (error message) or shadow-ban it. Check for banned words, hashtags, or problematic images. Test with different content.

### Getting Help

1. **API errors:** INSTAGRAM_SETUP_PLAYBOOK.md or INSTAGRAM_API_SETUP.md
2. **Content questions:** INSTAGRAM_CONTENT_STRATEGY.md
3. **Client onboarding:** INSTAGRAM_SETUP_PLAYBOOK.md
4. **Meta issues:** META_APP_TROUBLESHOOTING.md
5. **Still stuck:** Check Meta's official API docs or contact support

---

## 🎓 Learning Resources

### Official Meta Docs
- [Instagram Graph API](https://developers.facebook.com/docs/instagram-api)
- [Graph API Reference](https://developers.facebook.com/docs/instagram-api/reference)
- [Best Practices](https://developers.facebook.com/docs/instagram/guides)

### Tools
- [Graph API Explorer](https://developers.facebook.com/tools/explorer) — Test API calls
- [Meta App Dashboard](https://developers.facebook.com/apps) — Manage apps & tokens
- [Instagram Insights](https://instagram.com) → Profile → Insights — Analytics

### Templates & Examples
- Content Calendar: INSTAGRAM_CONTENT_STRATEGY.md Part 7
- Engagement Log: ENGAGEMENT_LOG.md
- Posting Script: post-to-instagram.sh

---

## ✅ Deployment Checklist (New Client)

- [ ] Read SERVICE_SCHEMA.md (understand service tiers)
- [ ] Follow INSTAGRAM_SETUP_PLAYBOOK.md (Phase 1-4)
- [ ] Verify all tests pass (Step 3.3)
- [ ] Review INSTAGRAM_CONTENT_STRATEGY.md with client
- [ ] Create first 4-week content calendar
- [ ] Post first 3-4 posts successfully
- [ ] Monitor engagement for 2 weeks
- [ ] Generate first report
- [ ] Collect client feedback
- [ ] Document learnings for next client

**Time to first post:** ~2-3 hours (setup + first content)

---

## 📝 Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-04-02 | Facebook schema + playbook |
| 2.0 | 2026-04-06 | Added Instagram (API setup, playbook, strategy) |
| 2.1 | 2026-04-06 | Added quick reference + deployment summary |

---

## 👤 Contact & Ownership

**Service Owner:** Jose Luis Mitjavila  
**Implementation:** Mitjavila Enterprise  
**First Client:** Mitjavila Enterprise (pilot)  

**Questions?** Check the relevant guide above. All documentation is self-contained.

---

**Ready to go! 🚀**

Start with **INSTAGRAM_SETUP_PLAYBOOK.md** to set up Instagram for Mitjavila Enterprise.

Then use **INSTAGRAM_CONTENT_STRATEGY.md** to plan content and **INSTAGRAM_QUICK_REFERENCE.md** for daily posting.

Good luck! 🎯
