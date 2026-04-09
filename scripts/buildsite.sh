#!/bin/bash

set -e

echo "Rebuilding site..."

rm -rf public/
mkdir public
cp -r assets public/

for page in pages/*.html; do
    echo "→ building ${page#pages/}..."
    scripts/buildpage.sh "$page"
done

echo "Finished!"