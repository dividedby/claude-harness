---
name: cloudflare-deploy
description: Deploy and wire Cloudflare DNS. Traefik + LetsEncrypt, managed platforms, static CDN. Use via /project:deploy.
---

Requires: CLOUDFLARE_API_TOKEN env var. Zone ID from docs/project.md.

Pattern A - Self-hosted (Traefik + LetsEncrypt):
Traefik labels: traefik.enable=true, Host rule, entrypoints=websecure, tls.certresolver=letsencrypt
Cloudflare A record: curl POST to /zones/$CF_ZONE/dns_records with proxied:true

Pattern B - Managed (Railway/Vercel/Render):
Deploy via platform -> get deployment URL -> Cloudflare CNAME -> deployment URL

Pattern C - Static (Cloudflare Pages):
Pages -> Create project -> Connect repo -> set build command -> custom domain

Verification: dig <domain> +short && curl -I https://<domain>
