#!/bin/bash
set -eux

if [ $# -lt 2 ]; then
    echo Missing arguments
    exit 1
fi

URL="$1"
FILEPATH="$2"

WORD="$2"
EXTRACTED=$(basename "$WORD")
TITLE=$(basename "$WORD")
TITLE+=" Repo"

mkdir -p "$TITLE" || exit 1
cd "$TITLE"
git init

echo "Created a repo"

git remote add singlefile "$URL"
git config core.sparseCheckout true
echo "$FILEPATH" > .git/info/sparse-checkout
git fetch singlefile main
git checkout main

mv "$EXTRACTED" ../
cd ..
rm -r "$TITLE"







