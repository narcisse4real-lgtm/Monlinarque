#!/usr/bin/env bash
set -euo pipefail
cat chunks/group*/chunk-*.txt | tr -d '\r\n ' | base64 -d > /tmp/monlinarque-v3.tar.gz
rm -rf /tmp/monlinarque-v3-src
mkdir -p /tmp/monlinarque-v3-src
tar -xzf /tmp/monlinarque-v3.tar.gz -C /tmp/monlinarque-v3-src --strip-components=1
cp -a /tmp/monlinarque-v3-src/. .
npm ci --include=dev
npm run build
