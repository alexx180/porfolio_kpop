#!/bin/bash

FILE="${1#pages/}"
# Date actuelle
DATE=$(date +%d/%m/%Y)
TITLE="$(basename "$FILE" .html)"


function buildpage {
    cat layout/before.html
    cat "${1}"
    cat layout/after.html
}

function current_pages {
    sed "s~href=\"${FILE}\"~& class=\"current\"~" | #change le lien par lui-meme et la class current
    sed "s~{{TITLE}}~${TITLE}~" | #change le titre par le titre 
    sed "s~{{DATE}}~${DATE}~" # change la date par la date 
}

if [[ "${1}" = "" ]]; then
    echo "Usage: ${0} PAGE" >&2
    exit 1

elif test ! -f "${1}"; then
    echo "${0}: error: ${1}: no such file" >&2
    exit 1

else # si tout va bien on construit la page dans public/
    buildpage "${1}" | current_pages > "public/${FILE}"
    echo "La page ${TITLE}.html a bien été crée !"
fi

