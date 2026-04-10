# LinkedIn Setup Playbook

**Platform:** LinkedIn Company Pages  
**Status:** Draft / Initial rollout  
**Last Updated:** 2026-04-10

---

## Purpose

This playbook defines how Mitjavila Enterprise should add LinkedIn to the Social Media Management service.

The first objective is simple: make LinkedIn a reliable third platform for business-facing posting, starting with **company-page text posts**, then expanding into image, document, and reporting workflows.

---

## Recommended Rollout

### Phase 1
- Company page posting only
- Text-only posts
- Manual approval before publish
- Track post cadence and engagement manually

### Phase 2
- Image and document posts
- Stronger content templates for case studies and proof of work
- Basic analytics and monthly reporting

### Phase 3
- Cross-platform packaging for Facebook, Instagram, and LinkedIn
- Lead capture workflow
- Reusable onboarding for future clients

---

## Reality Check

LinkedIn is not as straightforward as Meta for business posting.

Important differences:
- OAuth setup is stricter
- Organization posting requires the authenticated user to have the right page role
- Requests must include `Linkedin-Version` and `X-Restli-Protocol-Version: 2.0.0`
- Media posting is more involved than text posting because assets usually need to be uploaded first

**Recommendation:** Start with company-page text posts, validate access, then add media.

---

## What We Need Before Setup

- A LinkedIn Company Page for the client
- Access to the account of someone who is an admin or content admin on that page
- A LinkedIn Developer app
- OAuth redirect URI for token generation
- Agreement on whether we are posting to the company page, a personal profile, or both

**Default recommendation:** Start with the company page only.

---

## Required Access and Permissions

For company-page posting, Phase 1 should assume:

- `w_organization_social` for posting
- `r_organization_social` for retrieval and validation
- LinkedIn page role such as `ADMINISTRATOR` or `CONTENT_ADMIN`

For personal-profile posting, LinkedIn commonly uses:

- `w_member_social`

For this service, company-page posting is the better default because it aligns with business branding and avoids mixing client operations with a personal profile.

---

## Environment Variables

Add these to the client's `.env.local` when the LinkedIn app is ready:

```bash
LINKEDIN_ACCESS_TOKEN=
LINKEDIN_ORGANIZATION_URN=urn:li:organization:YOUR_ORG_ID
LINKEDIN_API_VERSION=202603
```

Optional later:

```bash
LINKEDIN_PERSON_URN=
```

---

## Basic Setup Steps

### 1. Create or Confirm the Company Page
- Verify the client's LinkedIn company page exists
- Confirm the correct brand name, logo, and URL
- Confirm who has admin access

### 2. Create the LinkedIn App
- Go to the LinkedIn Developer Portal
- Create an app for the business
- Add branding and legal details as required
- Save the client ID and client secret securely

### 3. Configure Products / Permissions
At minimum, configure the app for the LinkedIn sharing workflow needed for posting.

For the current rollout, the goal is organization posting access, not just profile sign-in.

### 4. Configure OAuth
- Add the approved redirect URI
- Run the OAuth authorization flow
- Generate an access token from an account with the correct page role
- Store the token securely in `.env.local`

### 5. Capture the Organization URN
- Identify the LinkedIn organization URN for the company page
- Save it in `.env.local`
- Save it in `CLIENT_SETUP.md` without exposing sensitive tokens

### 6. Run the First Test Post
Use the script:

```bash
cd /home/jose/.openclaw/workspace/services/social-media/clients/mitjavila-enterprise/
bash post-to-linkedin.sh "Testing LinkedIn posting for Mitjavila Enterprise."
```

Expected result:
- HTTP `201 Created`
- A post URN returned in the `x-restli-id` header
- Visible post on the company page

---

## Posting Guidelines for LinkedIn

### Best Content Types
- Business updates
- Proof of work
- Client wins
- Short lessons learned
- Before/after improvements
- Team, capability, or service announcements

### Tone
- Professional but not stiff
- Clear and confident
- Less casual than Facebook
- Less hashtag-heavy than Instagram

### Cadence
- Start with 2 to 4 posts per week
- Prefer weekday business hours
- Keep copy concise and useful

### Good LinkedIn Post Formula
1. Clear opening line
2. Useful business point or result
3. Practical takeaway or offer
4. Light CTA
5. 3 to 5 relevant hashtags max

---

## Technical Notes

### Text Post Endpoint
Use the LinkedIn Posts API:

- `POST https://api.linkedin.com/rest/posts`

Required headers:
- `Authorization: Bearer ...`
- `Content-Type: application/json`
- `Linkedin-Version: YYYYMM`
- `X-Restli-Protocol-Version: 2.0.0`

### Minimum Body Shape
```json
{
  "author": "urn:li:organization:123456",
  "commentary": "Sample text post",
  "visibility": "PUBLIC",
  "distribution": {
    "feedDistribution": "MAIN_FEED",
    "targetEntities": [],
    "thirdPartyDistributionChannels": []
  },
  "lifecycleState": "PUBLISHED",
  "isReshareDisabledByAuthor": false
}
```

### Media Posting
Not included in v1 of the script.

When we add media support, we should do it cleanly as a separate step because LinkedIn requires asset handling before publish.

---

## Go-Live Checklist

- [ ] LinkedIn company page confirmed
- [ ] Correct admin account identified
- [ ] LinkedIn app created
- [ ] OAuth flow tested
- [ ] Access token stored in `.env.local`
- [ ] Organization URN captured
- [ ] First text post published successfully
- [ ] Basic posting cadence agreed
- [ ] LinkedIn content examples added to the calendar

---

## Recommendation for Mitjavila Enterprise

For Mitjavila Enterprise specifically, LinkedIn is a strong fit.

Why:
- Better match for B2B credibility than Instagram alone
- Good channel for service positioning, project updates, and proof of execution
- Useful for building authority around business modernization, systems, and practical implementation

Best first move:
- Start with one clean company-page post announcing capabilities and value proposition
- Then post short examples of real work, improvements, and outcomes

---

## Next Build Items

1. Confirm company-page details and page admin access
2. Generate LinkedIn access token
3. Test `post-to-linkedin.sh`
4. Add LinkedIn content examples to `CONTENT_CALENDAR.md`
5. Add media-post support later
