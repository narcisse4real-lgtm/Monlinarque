#!/usr/bin/env bash
set -euo pipefail
export NEXT_TELEMETRY_DISABLED=1
cat chunks/chunk-*.txt | tr -d '\r\n ' | base64 -d > /tmp/monlinarque-source.zip
echo "2ede12f7484b72aff04ff13cce86a4e87c91c1fe73fd87f2808da936175de37f  /tmp/monlinarque-source.zip" | sha256sum -c -
rm -rf /tmp/monlinarque-source
mkdir -p /tmp/monlinarque-source
unzip -q /tmp/monlinarque-source.zip -d /tmp/monlinarque-source
cp -a /tmp/monlinarque-source/monlinarque/. .
npm ci
npm run build
