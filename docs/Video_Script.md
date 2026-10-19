# Video script (5–7 minutes)

**0:00–0:45 Intro.** Names, topic, the problem: scanners cannot see runtime attacks. Falco fills the gap. Show the DevOps lifecycle and point to the Security stage.

**0:45–1:30 Tool overview.** Falco = kernel events + rules + alerts. CNCF, open source. Show the architecture table from the report.

**1:30–2:30 Setup.** Show the repo, `docker-compose.yml` and `docker compose up -d`, then `docker compose ps` and the Falco startup log.

**2:30–4:30 Live demo.** Two terminals side by side: `docker logs -f falco` and `./scripts/attack_demo.sh`. Narrate each of the five attacks and point at the alert (rule name, container, command).

**4:30–5:15 Custom rules.** Open `custom_rules.yaml`, explain condition/output/priority, show the two custom alerts. Mention rules are validated in GitHub Actions (show a green run).

**5:15–6:30 Comparison.** Show the table: Falco vs Trivy vs AppArmor/seccomp vs Tracee on the four headings. Key message: they complement each other.

**6:30–7:00 Conclusion.** Advantages, limitation (alerts, does not block), lessons learned. Thank you.

Tips: record at 1080p with OBS, increase the terminal font size, rehearse once, and keep each person speaking for part of it.
