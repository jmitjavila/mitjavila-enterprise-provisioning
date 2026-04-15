# mitjavila-enterprise provisioning

This repository holds provisioning and deployment artifacts for the Mitjavila Enterprise host(s).

Primary folder:
- provisioning/searxng — SearXNG Docker Compose setup (see its README for usage).

Secrets
- core-config/settings.yml is intentionally ignored. Use provisioning/searxng/settings.example.yml and .env.example as templates and create your own local settings.yml/.env with secrets kept off-repo.

Quick start
```bash
cd provisioning/searxng
# edit .env (or copy .env.example) and core-config/settings.yml from settings.example.yml
docker compose up -d
```

If you want anything else added (CI, CONTRIBUTING, deployment notes), tell me what to include.