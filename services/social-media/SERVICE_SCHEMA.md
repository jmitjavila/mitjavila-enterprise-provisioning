# Social Media Management Service Schema

## Overview

**Service Name:** Social Media Management (SMM)  
**Current Platforms:** Facebook, Instagram, LinkedIn (Phase 1-3)  
**Status:** Pilot (ME as first customer)  
**Created:** 2026-04-02  
**Updated:** 2026-04-10 (LinkedIn added to service scope)

---

## Core Offering

### What We Do (Mitjavila Enterprise)

1. **Content Calendar & Scheduling**
   - Receive client images and messaging intent
   - Create copy/captions that align with brand voice
   - Schedule posts on a regular cadence
   - Manage posting times for optimal engagement

2. **Engagement Monitoring**
   - Daily/weekly monitoring of comments and messages
   - Track engagement metrics (likes, shares, comments)
   - Respond to comments (or flag for client review)
   - Monitor for trends or issues

3. **Analytics & Reporting**
   - Weekly/monthly analytics summaries
   - Track reach, impressions, follower growth
   - Identify top-performing content
   - Provide insights and recommendations

### What the Client Does

1. **Content Creation**
   - Produce images/media assets
   - Provide messaging direction or talking points
   - Flag urgent updates or timely content opportunities

2. **Brand Decisions**
   - Approve posting schedule and tone
   - Provide feedback on engagement responses
   - Set goals/KPIs for the service

3. **Availability**
   - Respond to time-sensitive engagement (if applicable)
   - Provide timely content assets

---

## Client Onboarding Checklist

### Pre-Setup (Coordinator)
- [ ] Define posting frequency (e.g., 3x/week, daily, etc.)
- [ ] Identify brand voice/tone (casual, professional, mixed)
- [ ] Confirm engagement response policy (auto-respond, escalate, or ignore)
- [ ] Get Facebook page admin credentials (email + permission)

### API & Access Setup
- [ ] Create Meta App for page
- [ ] Generate Facebook Graph API token
- [ ] Configure app permissions (pages_manage_posts, pages_read_engagement, pages_read_metadata)
- [ ] Test API access on page

### Content Workflow Setup
- [ ] Share client's image/content schedule (how/where)
- [ ] Create shared posting template (format, schedule format)
- [ ] Define approval workflow (if any)
- [ ] Set up reporting cadence (weekly, bi-weekly, monthly)

---

## Posting Workflow Schema

### Input: Client Provides
- **Image:** JPG/PNG asset
- **Message Intent:** Brief description of what to communicate (e.g., "new product launch", "team milestone", "call-to-action for event")
- **Target Date/Time:** When to post (or "ASAP")

### Process: Mitjavila Creates
1. Write caption/copy (2-3 sentences typically)
2. Add hashtags (3-5 relevant)
3. Format for platform
4. Schedule via API or native scheduler

### Output: Post Goes Live
- **Tracked:** Post ID, publish time, initial metrics
- **Monitored:** Engagement data collected daily

### Template Record (Spreadsheet/Database)
| Date | Image | Message Intent | Caption | Hashtags | Scheduled Time | Post ID | Reach | Engagement |
|------|-------|-----------------|---------|----------|----------------|---------|-------|------------|
| | | | | | | | | |

---

## Engagement Monitoring Schema

### Daily Tasks
- [ ] Check for new comments on recent posts
- [ ] Check for direct messages on page
- [ ] Log comment volume and sentiment (positive/neutral/negative)

### Response Policy (To Be Set Per Client)
- **Escalate:** Urgent questions, complaints, leads
- **Auto-respond:** Generic thank-yous, "we'll get back to you"
- **Ignore:** Spam, off-topic

### Engagement Log Template
| Date | Post ID | Comment Count | Message Count | Response Actions | Notes |
|------|---------|----------------|----------------|------------------|-------|
| | | | | | |

---

## Analytics & Reporting Schema

### Metrics Tracked (Facebook Insights)
- **Reach:** # of unique people who saw the post
- **Impressions:** Total times the post appeared
- **Engagement:** Likes + comments + shares
- **Click-Through Rate (CTR):** Clicks on links in posts
- **Follower Growth:** Net new followers over period
- **Top Post:** Best-performing post by reach/engagement

### Report Cadence
- **Frequency:** Weekly or monthly (client choice)
- **Format:** PDF summary (client-facing) or raw data sheet (if requested)
- **Distribution:** Email to client

### Report Template
**[Client] Social Media Report — [Period]**

**Summary Metrics**
- Posts Published: X
- Total Reach: X
- Total Engagement: X
- Follower Growth: +X
- Avg. Engagement Rate: X%

**Top Post**
- [Image/Caption]
- Reach: X | Engagement: X

**Insights & Recommendations**
- What worked (themes, timing, format)
- What didn't
- Recommended adjustments for next period

---

## Service Tiers (Future)

### Tier 1: Starter
- 1 platform (Facebook OR Instagram)
- 4-8 posts/month
- Weekly engagement monitoring
- Monthly analytics report
- **Price:** TBD

### Tier 2: Standard
- 1-2 platforms (Facebook, Instagram, or LinkedIn)
- 12-16 posts/month (combined)
- Daily engagement monitoring
- Bi-weekly analytics report
- Comment responses included
- **Includes:** Content strategy, visual guidelines, posting template
- **Price:** TBD

### Tier 3: Premium
- 3 platforms (Facebook + Instagram + LinkedIn)
- 20+ posts/month
- Daily engagement + message management
- Weekly analytics + strategy calls
- Lead capture & CRM integration
- Video/Reel creation support
- **Price:** TBD

---

## Constraints & Notes

### Privacy & Security
- Client credentials stored securely (never shared)
- API tokens rotated periodically
- Access logs maintained for compliance

### Limitations
- Platform algorithms change; reach/engagement not guaranteed
- Service relies on quality of client-provided content
- Response time to comments subject to business hours (TBD)

### Success Metrics (Client-Facing)
- Consistent posting schedule met
- Engagement rate trending upward
- Follower growth month-over-month
- Quality of copy/captions

---

## Platform-Specific Guides

### Facebook
- **Setup:** META_APP_SETUP.md
- **Playbook:** SETUP_PLAYBOOK.md
- **Key Differences:** Longer captions, broader audience, family-focused
- **Posting Frequency:** 2-4x/week
- **Rate Limits:** 200 posts/day (not a practical constraint)

### Instagram
- **Setup:** INSTAGRAM_API_SETUP.md
- **Playbook:** INSTAGRAM_SETUP_PLAYBOOK.md
- **Content Strategy:** INSTAGRAM_CONTENT_STRATEGY.md
- **Key Differences:** Visual-first, shorter captions, younger audience
- **Posting Frequency:** 3-4x/week recommended
- **Rate Limits:** 200 feed posts/day, 100 Reels/day, 10 posts/hour burst limit
- **Content Focus:** Images (1080x1350px), Carousels, Reels, Stories
- **Best Engagement:** Motivational content, educational carousels, team culture

### LinkedIn
- **Setup:** LINKEDIN_SETUP_PLAYBOOK.md
- **Playbook:** LINKEDIN_SETUP_PLAYBOOK.md
- **Key Differences:** Professional audience, credibility-driven, stronger fit for B2B and authority building
- **Posting Frequency:** 2-4x/week recommended
- **Phase 1 Content Focus:** Text posts, business updates, proof of work, lessons learned, announcements
- **Phase 1 API Scope:** Company-page posting with `w_organization_social`
- **Phase 2 Content Focus:** Media posts, documents, case studies, lead-generation workflow
- **Best Engagement:** Practical insights, before/after results, client wins, professional positioning

---

## Next Steps

1. **Pilot Setup:** ✅ Configure ME's Facebook page for API access (done)
2. **Instagram Setup:** 🚀 Configure ME's Instagram for API access (ready to launch)
3. **LinkedIn Setup:** 🚧 Configure ME's LinkedIn company-page access and text-post workflow
4. **Test Workflow:** Run 2-4 weeks of live posting across active platforms
5. **Document Learnings:** Update this schema based on real-world experience
6. **Refine & Codify:** Lock in templates, timelines, and processes for each platform
7. **Repeat:** Apply schema to next client with minimal friction (Facebook + Instagram + LinkedIn as needed)

---

**Schema Version:** 3.0  
**Last Updated:** 2026-04-10  
**Pilot Customer:** Mitjavila Enterprise (ME)  
**Status:** Facebook Active, Instagram Ready to Deploy, LinkedIn In Planning / Setup
