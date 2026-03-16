# External Services

> List services and where credentials live. NEVER write actual API keys here.

| Service | Purpose | Credentials Location | Docs |
|---------|---------|----------------------|------|
| PostgreSQL | Primary database | .env → DATABASE_URL | [link] |
| Auth.js | Authentication | .env → AUTH_SECRET + providers | [link] |
| Resend | Transactional email | .env → RESEND_API_KEY | [link] |
| Stripe | Payments | .env → STRIPE_SECRET_KEY | [link] |
| Trigger.dev | Background jobs | .env → TRIGGER_SECRET_KEY | [link] |
| Composio | App integrations | .env → COMPOSIO_API_KEY | [link] |
