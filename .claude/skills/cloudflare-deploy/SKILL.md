---
name: cloudflare-deploy
description: Wire a deployed app to a Cloudflare-managed domain. Handles three patterns: Traefik + Let's Encrypt on self-hosted Docker, managed platforms (Railway/Render/Vercel), and static CDN. Use after a new service is running and you need DNS and TLS set up.
allowed-tools: Bash, Read, Edit
---

# Cloudflare Deploy

## Before starting
Read `docs/project.md` for:
- what domain(s) are used
- which Cloudflare zone applies
- what deployment method is in use

## Pattern 1: Traefik + Let's Encrypt (self-hosted Docker)

### Required Traefik labels in docker-compose.yml
```yaml
labels:
  - "traefik.enable=true"
  - "traefik.http.routers.<service>.rule=Host(`<subdomain>.<domain>`)"
  - "traefik.http.routers.<service>.entrypoints=websecure"
  - "traefik.http.routers.<service>.tls=true"
  - "traefik.http.routers.<service>.tls.certresolver=letsencrypt"
  - "traefik.http.services.<service>.loadbalancer.server.port=<port>"
```

### Cloudflare DNS record
- Type: A (or CNAME to server hostname)
- Name: `<subdomain>`
- Proxy status: **DNS only (grey cloud)** for Let's Encrypt to work
- After cert is confirmed: switch to **Proxied (orange cloud)**

### Steps
1. Verify Traefik labels are correct in compose file
2. Restart service: `docker compose up -d <service>`
3. Check Traefik dashboard or logs for cert issuance
4. Create/update Cloudflare DNS A record (grey cloud)
5. Verify HTTPS works: `curl -I https://<subdomain>.<domain>`
6. Switch to orange cloud (proxied) in Cloudflare

---

## Pattern 2: Managed platform (Railway, Render, Vercel)

### Steps
1. Get the platform-provided domain from the service dashboard
2. In Cloudflare DNS: add CNAME `<subdomain>` → `<platform-domain>` (proxied)
3. In the platform: add custom domain `<subdomain>.<your-domain>`
4. Wait for platform TLS verification (usually automatic)
5. Verify: `curl -I https://<subdomain>.<domain>`

---

## Pattern 3: Static site / CDN

### Steps
1. Deploy static files to CDN (Cloudflare Pages, Netlify, etc.)
2. In Cloudflare: add CNAME or use Pages custom domain feature
3. Verify propagation: `dig <subdomain>.<domain>`

---

## Verification checklist
- [ ] DNS record exists and correct type
- [ ] TLS cert valid (`curl -I` returns 200, not TLS error)
- [ ] Proxy status appropriate for pattern
- [ ] App responds at the domain
- [ ] HTTP redirects to HTTPS
