# Homestead Monitoring & Yield Intelligence — Sales, Pricing, and Intake Materials

This file is an **index** of client-facing and internal materials that support the Homestead Monitoring service.

All paths below are relative to the workspace root: `~/.openclaw/workspace/`.

---

## 1. Client-Facing Sales & Pricing Docs

These live under the brand templates directory.

### 1.1 Sales Sheet (Client-Ready)

- **Path:** `mitjavila-brand/templates/homestead-monitoring-sales-sheet.html`
- **Purpose:** One-page sales sheet describing the service, ideal clients, monitoring areas, dashboard/visual history, package options, and deployment choices.
- **Usage:**
  - Convert to PDF for sharing with prospects.
  - Use as the backbone for website copy or proposal summaries.

### 1.2 Pricing Summary (Client-Facing)

- **Path:** `mitjavila-brand/templates/homestead-monitoring-pricing-summary.html`
- **Purpose:** Simple pricing reference for:
  - Essentials Monitoring
  - Grower Monitoring
  - Yield Optimization
  - Deployment options and how they affect pricing/support
- **Usage:**
  - As a starting point for quotes.
  - For aligning internal expectations before sending a proposal.

---

## 2. Intake & Handoff Framework (Internal)

These exports live inside the Mitjavila Enterprise internal docs. They are **internal-only** and may contain example data; treat them as structure references, not client-ready material.

### 2.1 Benjie Intake Checklist (Export)

- **Path:** `mitjavila-enterprise/04-business-organization-service/exports-benjie/49-benjie-intake-checklist.html`
- **Purpose:** Checklist-style intake for new opportunities, with Homestead Monitoring as one of the primary service categories.
- **Usage:**
  - Reference for what questions to ask during discovery.
  - Source for building a clean, client-agnostic `INTAKE_TEMPLATE.md` in this service folder later.

### 2.2 Sample Homestead Intake & Handoff (Export)

- **Path:** `mitjavila-enterprise/04-business-organization-service/exports-benjie/51-sample-homestead-intake-and-handoff.html`
- **Purpose:** A filled sample showing what a real intake and internal handoff could look like for a Homestead Monitoring client.
- **Important:**
  - Contains example names and details.
  - Do **not** copy sample names, addresses, or contact details into shared templates.
  - Use only for structure, question sets, and internal framing.

---

## 3. How This Ties Into the Service Folder

Within `services/homestead-monitoring/`:

- `README.md` gives the high-level description and website-aligned positioning.
- `SERVICE_SCHEMA.md` defines the **service itself**:
  - monitoring domains
  - package levels
  - deployment models
  - assistant/interaction model
  - boundaries & responsibilities
- `SALES_MATERIALS.md` (this file) tells you **where to find**:
  - the polished sales + pricing docs
  - the current intake/handoff examples for Homestead Monitoring

Next iteration when needed:

- Create a clean, client-agnostic `INTAKE_TEMPLATE.md` based on the export files.
- Add any new sales one-pagers or proposal language here so everything for this service is discoverable in one place.
