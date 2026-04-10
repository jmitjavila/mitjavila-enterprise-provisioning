# SearXNG deployment

This is a simple Docker Compose setup for running SearXNG on this host.

## Current default

- Bind address: `127.0.0.1`
- Port: `8080`
- URL: `http://127.0.0.1:8080`

This keeps the instance private by default.

## Files

- `docker-compose.yml` - SearXNG + Valkey services
- `.env` - local port/bind settings
- `.env.example` - starter copy
- `core-config/settings.yml` - basic SearXNG settings

## Start

```bash
cd /home/jose/.openclaw/workspace/provisioning/searxng
docker compose up -d
```

## Stop

```bash
cd /home/jose/.openclaw/workspace/provisioning/searxng
docker compose down
```

## Logs

```bash
cd /home/jose/.openclaw/workspace/provisioning/searxng
docker compose logs -f core
```

## Make it public later

If you want internet access, do not expose it raw on `0.0.0.0` without a reverse proxy.
Use Caddy or Nginx in front of it, then:

1. Change `SEARXNG_BIND_ADDRESS` in `.env` to `127.0.0.1` and keep it private.
2. Publish it through the reverse proxy on a domain.
3. Turn on rate limiting / bot protection before public exposure.
