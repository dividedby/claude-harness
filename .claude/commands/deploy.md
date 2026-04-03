Deploy and wire Cloudflare DNS.

1. Read docs/project.md for: domain, CF zone ID, deploy target, service name

2. Deploy (match project target):
   - Dokploy: verify service running, health check passes
   - Railway/Vercel: push, confirm deployment URL

3. Wire Cloudflare DNS (requires CLOUDFLARE_API_TOKEN env var):
   curl -X POST "https://api.cloudflare.com/client/v4/zones/$CF_ZONE/dns_records" \
     -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
     -H "Content-Type: application/json" \
     --data '{"type":"A","name":"<sub>","content":"<ip>","proxied":true}'

4. Traefik labels (if self-hosted):
   traefik.enable=true
   traefik.http.routers.<svc>.rule=Host(`<domain>`)
   traefik.http.routers.<svc>.tls.certresolver=letsencrypt

5. Verify: dig <domain> +short && curl -I https://<domain>

Domain: $ARGUMENTS
