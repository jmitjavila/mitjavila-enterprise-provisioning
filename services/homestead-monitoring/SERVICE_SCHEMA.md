# Homestead Monitoring & Yield Intelligence — Service Schema

_Status: Draft → based on sales sheet, pricing summary, and intake framework_

## 1. Overview

Homestead Monitoring & Yield Intelligence is a structured monitoring and reporting service for **homesteads, small farms, and growers** who want:

- better visibility into conditions across their land
- stronger operational oversight
- more informed day‑to‑day decisions

Mitjavila Enterprise helps clients monitor key conditions, organize useful records, identify issues earlier, and connect environmental patterns with production outcomes over time. This is not just a generic tech setup – it is a practical service built around the real needs of the operation.

## 2. Ideal Clients

From the sales materials:

- Homesteads growing food or managing mixed production
- Small farms that want stronger monitoring and oversight
- Growers who want more than scattered notes or disconnected devices
- Operations seeking clearer records for planning and improvement

## 3. What This Service Helps Clients Do

Core outcomes (from sales sheet + pricing summary):

- Monitor important environmental and growing conditions
- Keep organized historical records (environment, operations, production)
- Identify issues earlier instead of noticing problems too late
- Track patterns and trends over time
- Support stronger day‑to‑day decisions
- Connect field conditions with production results
- View key conditions, trends, and alerts through a client dashboard
- (Where included) monitor device health and reporting status

## 4. Monitoring Domains

### 4.1 Environmental Monitoring

Typical signals:

- Air temperature
- Humidity
- Rainfall
- Wind speed
- Weather history
- Forecast‑related conditions
- Sunlight / solar exposure where available

### 4.2 Soil & Field Monitoring

Options depending on tier/scope:

- Soil pH
- Soil moisture
- Soil temperature
- Zone‑specific field monitoring
- Additional field readings based on project scope

### 4.3 Operations Tracking

Operational records that can be structured into the system:

- Irrigation logs (events, timing, duration)
- Fertilizer / treatment records
- Planting / transplant dates
- Harvest dates
- Field notes
- Maintenance notes

### 4.4 Production / Yield Tracking

For clients who want to connect conditions to outcomes:

- Harvest weight
- Yield by crop or growing area
- Cull / loss rates
- Crop quality notes
- Pest / disease events
- Seasonal trend review

## 5. Core Package Levels

These are **standard package shapes** used in the sales and pricing docs. Actual price points can be tuned per client.

### 5.1 Essentials Monitoring

Best for clients who want visibility into **core environmental conditions** first.

**Scope:**

- Weather history tracking
- Air temperature and humidity monitoring
- Rainfall and wind speed tracking
- Basic client dashboard access
- Alert setup for selected thresholds

**Suggested pricing (from pricing summary):**

- Setup: ~$1,500–$2,000
- Monthly service: ~$150–$250/month

### 5.2 Grower Monitoring

Best for clients who want **stronger operational awareness and soil insight**.

**Scope:**

- Everything in **Essentials Monitoring**
- Soil moisture, soil temperature, and soil pH tracking
- Irrigation log setup or integration
- Enhanced dashboard views for soil and trend monitoring
- Monthly review and practical recommendations

**Suggested pricing:**

- Setup: ~$2,500–$3,500
- Monthly service: ~$250–$400/month

### 5.3 Yield Optimization

Best for clients who want to **connect conditions and operations to production outcomes**.

**Scope:**

- Everything in **Grower Monitoring**
- Production and harvest logging
- Yield tracking by crop or area
- Issue and event logging
- Seasonal review and proactive recommendations

**Suggested pricing:**

- Setup: ~$3,500–$5,500+
- Monthly service: ~$400–$750/month

### 5.4 Most Common Starting Point

- **Grower Monitoring** + **Mitjavila‑Managed Cloud Deployment** is the default starting recommendation in pricing docs.

## 6. Deployment Models

Deployment model affects complexity, support level, and shared responsibilities.

### 6.1 Mitjavila‑Managed Cloud Deployment (Recommended)

- Default / recommended option for most clients.
- Smoothest support experience and strongest reliability.
- Centralized dashboards and device health views.
- Mitjavila manages hosting, updates, and monitoring stack.

### 6.2 Local On‑Site Deployment

- More local control for the client.
- Typically more setup complexity and lower support efficiency.
- Higher sensitivity to local network/power conditions.
- More shared responsibility for on‑site maintenance and troubleshooting.

### 6.3 Fully Self‑Hosted / Isolated Deployment

- Custom, premium option with higher complexity.
- Client takes on more responsibility for hosting, backups, and uptime.
- Remote support is more limited and less efficient.
- Best suited for technically capable clients with strong local infrastructure needs.

## 7. Assistant / Interaction Model

Based on intake framework examples, typical interaction expectations:

- **Users:** usually 1–2 core users (owner/operator + occasional helper)
- **Usage:** regular, often mobile/outdoor
- **Interaction style:** voice‑first or mixed (voice + text), due to field/vehicle use

The assistant/service should help answer questions like:

- What changed since yesterday?
- Did anything go outside normal range?
- What should I check first today?
- Were there any important alerts?

And help organize:

- Daily summaries
- Alerts and follow‑up items
- Monitoring interpretation (what the numbers mean operationally)

## 8. Boundaries & Disclaimers

From business rules and pricing notes:

- The system supports **monitoring and decision support**, not guaranteed agronomic outcomes.
- The assistant should not:
  - Imply guaranteed crop or production results.
  - Act like a licensed agronomist or give regulated professional advice.
- Alerts and summaries should clearly distinguish:
  - Confirmed readings vs. inferred suggestions
  - Alerts vs. informational summaries
- Monitoring and device‑health visibility do **not** automatically include:
  - Unlimited hardware replacement
  - Unlimited on‑site field service
  - Unless explicitly included in the agreement

## 9. Client Responsibilities

Generic responsibilities to document for each engagement:

- Provide access to property systems/devices and any existing data sources.
- Approve monitoring and alerting rules (what to track, thresholds, who is notified).
- Participate in initial assessment and design conversations.
- Maintain local hardware (where applicable) or agree to a hardware‑support arrangement.

## 10. Engagement Flow (High Level)

1. **Discovery & Intake**
   - Understand property, production focus, and decision needs.
   - Capture desired monitoring domains and priority questions.

2. **Design & Proposal**
   - Recommend package and deployment model.
   - Define monitoring scope, data sources, and alerting rules.

3. **Implementation**
   - Install / integrate sensors and data feeds.
   - Configure dashboards, alerts, and logging.

4. **Pilot & Review**
   - Run for an initial period (e.g., 4–8 weeks).
   - Review data, alerts, and daily usefulness.

5. **Ongoing Monitoring & Optimization**
   - Regular reviews (e.g., monthly) for trends and issues.
   - Adjust thresholds, views, and workflows as needed.

---

This schema is intentionally **client‑agnostic**. Client‑specific intake, layouts, and decisions should live under `services/homestead-monitoring/clients/` or in separate client folders, with personal details kept out of shared templates.