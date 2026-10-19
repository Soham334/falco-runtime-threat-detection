#!/usr/bin/env bash
# Simulates suspicious behaviour inside the "victim-web" container.
# Run in one terminal while `docker logs -f falco` is open in another.
set -u
C=victim-web
pause() { echo; echo ">>> $1"; sleep 2; }

pause "1/5  Spawn an interactive-style shell inside the container"
docker exec "$C" sh -c "echo shell opened"

pause "2/5  Read a sensitive file (/etc/shadow)"
docker exec "$C" sh -c "cat /etc/shadow > /dev/null"

pause "3/5  Write into a system binary directory (/bin)"
docker exec "$C" sh -c "touch /bin/falco_test_file"

pause "4/5  CUSTOM RULE: run a network tool (wget)"
docker exec "$C" sh -c "wget -q -O /dev/null http://example.com || true"

pause "5/5  CUSTOM RULE: tamper with the web root"
docker exec "$C" sh -c "echo defaced > /usr/share/nginx/html/index.html"

echo; echo "Done. Check alerts with:  docker logs falco | tail -n 30   or   cat logs/events.log"
