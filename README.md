# Runtime Threat Detection for Containers Using Falco

DevOps Theory IA-2 case study. Falco watches a sample nginx container for suspicious behaviour
and raises real-time alerts. Includes two custom rules, alert logging, optional Discord
forwarding, and a GitHub Actions workflow that validates the rules.

## Requirements
- A **Linux** machine or VM (Ubuntu 22.04+ recommended; kernel with BTF/eBPF support)
- Docker and Docker Compose v2
- Not recommended: Docker Desktop on Windows/Mac directly. Use an Ubuntu VM instead.

## Run
    docker compose up -d
    docker logs -f falco          # terminal 1: watch alerts
    ./scripts/attack_demo.sh      # terminal 2: simulate the attacks
    cat logs/events.log           # alerts saved to a file

Reset between takes: `./scripts/reset_demo.sh`

## Layout
| Path | Purpose |
|---|---|
| docker-compose.yml | nginx victim app + Falco |
| falco/config.d/custom.yaml | Output to stdout and logs/events.log |
| falco/rules.d/custom_rules.yaml | Two custom rules |
| scripts/attack_demo.sh | Five attack simulations |
| scripts/alerts_to_discord.sh | Optional alert forwarding |
| .github/workflows/validate-rules.yml | CI check of Compose file and rules |
| docs/ | Report draft, video script |

## Expected alerts
| Action | Rule |
|---|---|
| docker exec ... sh | Terminal shell in container (default) |
| cat /etc/shadow | Read sensitive file untrusted (default) |
| touch /bin/... | Write below binary dir (default) |
| wget | Network Tool Run In Container (custom) |
| write to /usr/share/nginx/html | Web Root Modified In Container (custom) |

If a default rule does not fire on your system, note it in the report; do not fake a screenshot.
