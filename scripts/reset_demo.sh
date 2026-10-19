#!/usr/bin/env bash
# Restores the victim container to a clean state.
docker rm -f victim-web >/dev/null 2>&1
docker compose up -d victim-web
