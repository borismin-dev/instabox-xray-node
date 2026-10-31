# instabox-xray-node

Xray (VLESS + WebSocket) on an InstaBox free machine, published through the platform HTTPS gateway (gateway terminates TLS, forwards WS upgrades).

Sanitized archive of a working deployment (verified 2026-10-29, generate_204 = 204). All secrets are placeholders.

## Files
- `run.sh` — idempotent starter/keepalive: starts Xray only if it is not already running. The pgrep pattern uses the absolute path on purpose: a relative pattern silently never matches the real command line and every keepalive round would spawn a duplicate.
- `config.example.json` — replace YOUR_UUID_HERE / YOUR_WS_PATH, save as `config.json` next to the xray binary.

## Free-tier behavior
Idle pause after 1800 s; continuous-run cap 480 min, then ~10 min cooldown. A scheduler that execs `run.sh` every 10 min works as keepalive + self-heal. Persistent files go under `/data/home` (the top level of `/data` is not writable).
