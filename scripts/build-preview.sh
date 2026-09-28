#!/usr/bin/env bash
set -euo pipefail
cat chunks/chunk-*.txt | tr -d '\r\n ' | base64 -d > /tmp/monlinarque-source.tar.gz
tar -xzf /tmp/monlinarque-source.tar.gz --strip-components=1
./node_modules/.bin/next build
