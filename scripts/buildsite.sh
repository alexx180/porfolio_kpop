#!/bin/bash

set -e

echo "Rebuilding site..."

rm -rf docs/
mkdir docs
cp -r assets docs/

for page in pages/*.html; do
    echo "→ building ${page#pages/}..."
    scripts/buildpage.sh "$page"
done

echo "Finished!"