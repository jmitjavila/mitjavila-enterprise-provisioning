This repository includes a GitHub Actions workflow that can deploy the `provisioning` folder to a server and run the SearXNG compose stack.

Required repository secrets (Settings → Secrets → Actions):
- SSH_PRIVATE_KEY — private SSH key (PEM format) for the deploy user
- SERVER_HOST — server IP or hostname
- DEPLOY_USER — SSH user (must have the public key in ~/.ssh/authorized_keys)
- TARGET_DIR — absolute path on the server where the repo's `provisioning` folder will be synced (e.g. /srv/mitjavila-enterprise)

Server preflight (on the target host):
1. Create the deploy user and add the public key to /home/<user>/.ssh/authorized_keys.
2. Install Docker and Docker Compose plugin (or Docker Compose v2):
   - Debian/Ubuntu example: `sudo apt-get update && sudo apt-get install -y docker.io docker-compose-plugin`
3. Ensure the deploy user can run Docker (add to `docker` group) or use sudo in the workflow's remote commands.
4. Ensure the `TARGET_DIR` exists or the deploy user can create it.
How it works:
- On push to `master`, the workflow rsyncs `provisioning/` to `${TARGET_DIR}/provisioning/` on the server, then SSHes in and runs `docker compose pull` and `docker compose up -d --remove-orphans` inside the `provisioning/searxng` folder.

Testing:
- Verify SSH access from your machine: `ssh <DEPLOY_USER>@<SERVER_HOST>`.
- Create TARGET_DIR and test permissions: `ssh <DEPLOY_USER>@<SERVER_HOST> "mkdir -p <TARGET_DIR> && exit"`.
- Push to `master` to trigger the workflow.

Notes & security:
- Do NOT store secrets (settings.yml) in the repo. Use `settings.example.yml` as a template and place the real `settings.yml` on the server or in a secret store.
- The workflow expects a private SSH key stored in GitHub Secrets and the public key installed on the server.

If you want, I can also:
- Make the workflow create a release tag and/or rollback step.
- Use an alternative method (git pull on the server with a deploy key) instead of rsync.
