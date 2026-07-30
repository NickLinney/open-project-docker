# Security

## MVP Security Posture

- Local-only access defaults
- Secrets externalized through `.env`
- Dedicated database credentials
- Replaceable application containers
- Persistent data separated from runtime containers

## Deferred Hardening

- External TLS termination
- Secret manager integration
- Network policy beyond Docker network isolation
- Backup encryption automation

## Operator Guidance

- Never commit `.env`.
- Replace the example secrets before first real use.
- Keep the deploy key material outside the repository.
- Treat `SECRET_KEY_BASE` and database credentials as passwords.
