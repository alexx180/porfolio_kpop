#!/bin/bash

echo "Rebuilding site."
rm -rf public/
mkdir public
cp -r assets/* public/
for page in pages/*.html; do
    echo -n "> building ${page#pages/}..."
    scripts/buildpage.sh "$page"
    echo "done"
done
echo "Finished!"
