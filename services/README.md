# Services

This directory is the canonical home for all service offerings for Mitjavila Enterprise.
Each service lives in its own subdirectory and contains:

- A high-level overview (`README.md`)
- A formal definition (`SERVICE_SCHEMA.md`)
- Setup / playbooks and troubleshooting guides
- A `clients/` folder with per-client implementation details

---

## Current services

### Social Media Management (`social-media/`)

- **Service name:** Social Media Management (SMM)
- **Status:** Pilot (Mitjavila Enterprise as first customer)
- **Platforms:** Facebook, Instagram
- **Docs:**
  - `README.md` – orientation & usage guide
  - `SERVICE_SCHEMA.md` – service tiers, workflow, and responsibilities
  - `META_APP_SETUP.md`, `SETUP_PLAYBOOK.md` – Meta / Facebook API setup & onboarding
  - `INSTAGRAM_*.md` – Instagram API setup, playbook, strategy, and quick reference
  - `clients/` – per-client setup (credentials, calendars, logs, scripts)

### Search Authority Management (`search-authority-management/`)

- **Service name:** Search Authority Management
- **Status:** Draft (structure only)
- **Purpose:** Grow and maintain a client’s authority and visibility in search.
- **Docs:**
  - `README.md` – orientation
  - `SERVICE_SCHEMA.md` – skeleton for offering and workflow
  - `clients/` – to be created per client

### Business Organization (`business-organization/`)

- **Service name:** Business Organization
- **Status:** Draft (structure only)
- **Purpose:** Help clients structure their business, processes, and documentation.
- **Docs:**
  - `README.md` – orientation
  - `SERVICE_SCHEMA.md` – skeleton for offering and engagement model

### Website Creation (`website-creation/`)

- **Service name:** Website Creation
- **Status:** Draft (structure only)
- **Purpose:** Plan, design, build, and launch client websites.
- **Docs:**
  - `README.md` – orientation
  - `SERVICE_SCHEMA.md` – skeleton for offering, packages, and workflow

### Tailored AI Assistant System (`tailored-ai-assistant-system/`)

- **Service name:** Tailored AI Assistant System
- **Status:** Draft (structure only)
- **Purpose:** Design and deliver custom AI assistants for internal or client-facing use.
- **Docs:**
  - `README.md` – orientation
  - `SERVICE_SCHEMA.md` – skeleton for offering, tiers, and lifecycle

### Homestead Monitoring (`homestead-monitoring/`)

- **Service name:** Homestead Monitoring
- **Status:** Draft (structure only)
- **Purpose:** Monitor and manage homestead systems (property, safety, automations).
- **Docs:**
  - `README.md` – orientation
  - `SERVICE_SCHEMA.md` – skeleton for offering and engagement

---

## Adding a new service

1. Create a new folder under `services/` using a short, kebab-case name, for example:
   - `automation/`, `websites/`, `ai-assistant/`, etc.
2. Add at minimum:
   - `README.md` – what the service is and how to use this folder
   - `SERVICE_SCHEMA.md` – offering, tiers, workflows, and responsibilities
3. Add any setup playbooks, troubleshooting guides, and a `clients/` folder as needed.
4. Add the new service to this `services/README.md` index with a short summary and status.
