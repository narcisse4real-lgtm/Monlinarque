#!/usr/bin/env bash
set -euo pipefail

BUNDLE="/tmp/monlinarque-v2.zip"
WORK="/tmp/monlinarque-v2"

cat bundle-v2/chunk-*.txt | tr -d '\r\n ' | base64 -d > "$BUNDLE"
echo "b1047ba8ce3c805098db7ea52351b10242734cd8bf1bb8e23586dda6bef3eae6  $BUNDLE" | sha256sum -c -

rm -rf "$WORK"
mkdir -p "$WORK"
unzip -q "$BUNDLE" -d "$WORK"
cp -a "$WORK/monlinarque/." .

./node_modules/.bin/next build
