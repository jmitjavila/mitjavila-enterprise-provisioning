# Mitjavila Enterprise — Automated Posting Schedule

**Platform:** Facebook  
**Client Page:** Mitjavila Enterprise (966297459911400)  
**Month:** April 2026  
**Status:** ✅ LIVE

---

## Week 1 (April 7-11)

### Post 2: Core Philosophy
- **Date/Time:** Mon, April 7 @ 9:00 AM CDT (2:00 PM UTC)
- **Cron Job ID:** 878cf565-9ecd-4794-bbb5-09cb4ad382d3
- **Status:** ✅ SCHEDULED
- **Message:** "We Don't Do Generic Marketing Noise..."
- **Image:** post-2-core-philosophy.png
- **Post ID:** [Will be filled after posting]

### Post 3: Social Media Management
- **Date/Time:** Wed, April 9 @ 9:00 AM CDT (2:00 PM UTC)
- **Cron Job ID:** 351da8b8-f605-4ff5-8cae-9dcfaffe112f
- **Status:** ✅ SCHEDULED
- **Message:** "📱 Social Media Management — A Stronger Online Presence..."
- **Image:** post-3-social-media-management.png
- **Post ID:** [Will be filled after posting]

### Post 4: Business Organization
- **Date/Time:** Fri, April 11 @ 9:00 AM CDT (2:00 PM UTC)
- **Cron Job ID:** 0fc382da-7ba5-41f4-96b7-75958e3320da
- **Status:** ✅ SCHEDULED
- **Message:** "📊 Business Organization — Stronger Internal Structure..."
- **Image:** post-4-business-organization.png
- **Post ID:** [Will be filled after posting]

---

## Week 2 (April 14-18) — MANUAL POSTING

These posts need to be scheduled or posted manually. Use the script:

```bash
cd /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/
bash post-to-facebook.sh "Your message here"
```

### Post 5: Why Businesses Choose Mitjavila
- **Date/Time:** Mon, April 14 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "✅ Why Businesses Choose Mitjavila Enterprise..."
- **Image:** post-5-why-choose.png

### Post 6: Website Creation
- **Date/Time:** Wed, April 16 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "🌐 Website Creation — Your Digital Storefront..."
- **Image:** post-6-website-creation.png

### Post 7: Homestead Monitoring
- **Date/Time:** Fri, April 18 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "🌾 Homestead Monitoring — Data-Driven Operations..."
- **Image:** post-7-homestead-monitoring.png

---

## Week 3 (April 21-25) — MANUAL POSTING

### Post 8: The Mitjavila Process
- **Date/Time:** Mon, April 21 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "🔄 Our Process: From Conversation to Delivery..."
- **Image:** post-8-mitjavila-process.png

### Post 9: Strong Organization = Better Business
- **Date/Time:** Wed, April 23 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "💡 Strong Organization = Better Business..."
- **Image:** post-9-organization-growth.png

### Post 10: What Makes Practical Different?
- **Date/Time:** Fri, April 25 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "🏢 What Makes Practical Different?..."
- **Image:** post-10-practical-different.png

---

## Week 4 (April 28) — MANUAL POSTING

### Post 11: Monthly Reflection
- **Date/Time:** Mon, April 28 @ 9:00 AM CDT
- **Status:** READY
- **Message:** "🌟 April Reflection: What We've Learned..."
- **Image:** post-11-monthly-reflection.png

---

## How to Post Manually

**When you see the reminder (Monday/Wednesday/Friday at 9 AM CDT):**

1. Open terminal and navigate to:
   ```bash
   cd /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/
   ```

2. Run the posting script with the message:
   ```bash
   bash post-to-facebook.sh "📱 Social Media Management — A Stronger Online Presence

Building a credible online presence takes more than just posting.
It takes strategy, consistency, and clear messaging.

At Mitjavila Enterprise, we handle:
✓ Content planning tailored to your business
✓ Professional caption writing
✓ Platform-focused strategy
✓ Consistent brand voice
✓ Ongoing posting support

Ready to strengthen your social presence? Let's discuss your goals.

#SocialMediaManagement #OnlinePresence #MitjavilaEnterprise"
   ```

3. Script will return:
   ```
   ✅ Post successful!
   Post ID: 966297459911400_XXXXXXXXXXXXX
   URL: https://www.facebook.com/966297459911400_XXXXXXXXXXXXX
   ```

4. Update this document with the Post ID

---

## Post-Posting Checklist

After each post:

- [ ] Verify post appears on Facebook page
- [ ] Note the Post ID returned by script
- [ ] Update CONTENT_CALENDAR.md with Post ID
- [ ] Check back 1-2 hours later for initial engagement
- [ ] Log engagement in ENGAGEMENT_LOG.md

---

## Monitoring Schedule

**Daily (9-10 AM, 1-2 PM, 5-6 PM CDT):**
- Check for comments on recent posts
- Check for direct messages
- Log in ENGAGEMENT_LOG.md

**Weekly (Fridays):**
- Generate weekly summary (reach, engagement, top post)
- Email to client (optional)

**Monthly (Last day of month):**
- Pull full analytics from Facebook Insights
- Create monthly report
- Document learnings

---

## Quick Reference: Post IDs

| Post # | Date | Message | Post ID | Status |
|--------|------|---------|---------|--------|
| 1 | Apr 3 | Welcome | 966297459911400_122103410684882111 | ✅ Published |
| 2 | Apr 7 | Core Philosophy | [pending] | Scheduled |
| 3 | Apr 9 | Social Media Mgmt | [pending] | Scheduled |
| 4 | Apr 11 | Business Org | [pending] | Scheduled |
| 5 | Apr 14 | Why Choose | [pending] | Ready |
| 6 | Apr 16 | Website | [pending] | Ready |
| 7 | Apr 18 | Homestead | [pending] | Ready |
| 8 | Apr 21 | Process | [pending] | Ready |
| 9 | Apr 23 | Organization | [pending] | Ready |
| 10 | Apr 25 | Practical | [pending] | Ready |
| 11 | Apr 28 | Reflection | [pending] | Ready |

---

## Notes

- All posts use generated images (you can swap with custom images)
- Posts can be scheduled in advance using Facebook's native scheduler
- Engagement monitoring happens in ENGAGEMENT_LOG.md
- Analytics reported monthly in reporting template

---

**Schedule Version:** 1.0  
**Created:** 2026-04-03  
**Status:** LIVE — First 3 posts automated, remaining ready for manual posting
