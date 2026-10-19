# Checklist: Theory IA-2 (Falco) and Lab CA (ReleaseGuard)

## Do first (today)
- [ ] Confirm both topics and the real deadlines with the faculty (published dates have passed)
- [ ] Tell SRS the Falco tool so no other team takes it; fill in the sheet row
- [ ] Decide who does what in each group

## Theory IA-2: Falco
- [ ] Get a Linux machine/VM (Ubuntu 22.04 in VirtualBox is fine)
- [ ] Install Docker, clone/unzip this repo
- [ ] `docker compose up -d`, confirm Falco is running (screenshots 1–2)
- [ ] Run `./scripts/attack_demo.sh`, capture each alert (screenshots 3–7)
- [ ] Confirm both custom rules fire (screenshot 8); tune if needed
- [ ] Push repo to GitHub, confirm Actions run is green (screenshot 9)
- [ ] Optional: Discord forwarding (screenshot 10)
- [ ] Fill in the red placeholders in the report draft; write your own observations and lessons learned
- [ ] Record the 5–7 minute video using docs/Video_Script.md
- [ ] Submit: report, GitHub link, video

## Lab CA: ReleaseGuard
- [ ] Create Docker Hub token and GitHub repo; add the two teammates
- [ ] Add secrets DOCKERHUB_USERNAME, DOCKERHUB_TOKEN (and optional DISCORD_WEBHOOK_URL)
- [ ] Push the code from releaseguard.zip; every member commits via a feature-branch pull request
- [ ] First pipeline run must pass (creates the `stable` tag)
- [ ] Turn on branch protection for main
- [ ] Demo 1 good release (tag v1.0.0) / Demo 2 failing test / Demo 3 faulty release with rollback
- [ ] Screenshots of every stage, Docker Hub tags, GitHub Release, Discord messages
- [ ] Write the report (SecureNotes-style structure, own words)
- [ ] Rehearse the live demo once from a clean state
- [ ] Submit: report, GitHub link, live demo
