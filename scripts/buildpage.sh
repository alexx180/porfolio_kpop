#!/bin/bash

set -e

INPUT="$1"
FILE="${INPUT#pages/}"
DATE=$(date +%d/%m/%Y)
TITLE="$(basename "$FILE" .html)"

if [[ -z "$INPUT" ]]; then
    echo "Usage: $0 pages/file.html" >&2
    exit 1
fi

if [[ ! -f "$INPUT" ]]; then
    echo "Error: $INPUT not found" >&2
    exit 1
fi

buildpage() {
    cat layout/before.html
    cat "$1"
    cat layout/after.html
}

process() {
    sed "s~{{TITLE}}~$TITLE~g" |
    sed "s~{{DATE}}~$DATE~g"
}

mkdir -p docs

buildpage "$INPUT" | process > "docs/$FILE"

echo "✔ Built: $FILE"