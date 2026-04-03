---
name: cloudflare-deploy
description: Deploy and wire Cloudflare DNS. Traefik + LetsEncrypt, managed platforms, static CDN. Use via /project:deploy.
---

Requires: CLOUDFLARE_API_TOKEN env var. CF_ZONE from docs/project.md.

Pattern A - Self-hosted (Traefik + LetsEncrypt):
Labels: traefik.enable=true, Host rule, entrypoints=websecure, tls.certresolver=letsencrypt
DNS: curl POST to /zones/$CF_ZONE/dns_records with type A, proxied:true

Pattern B - Managed (Railway/Vercel/Render):
Deploy via platform -> get deployment URL -> Cloudflare CNAME record

Pattern C - Static (Cloudflare Pages):
Pages -> Create project -> Connect repo -> build command -> custom domain

Verify: dig <domain> +short && curl -I https://<domain>
