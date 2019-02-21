#!/bin/sh

set -eu

DEMO_DIR="$HOME/git/sc/filecoin-sourcecred-demo"
SOURCECRED_DIR="$sc"
SOURCECRED_CLI="$sc/bin/sourcecred.js"
export SOURCECRED_DIRECTORY="$DEMO_DIR/sourcecred_data"
SITE_DIR="$DEMO_DIR/site"

node "$SOURCECRED_CLI" load --organization filecoin-project

(cd "$SOURCECRED_DIR" && yarn build --output-path "$SITE_DIR")
mkdir -p "$SITE_DIR/api/v1"
cp -r "$SOURCECRED_DIRECTORY" "$SITE_DIR/api/v1/data"
rm -rf "$SITE_DIR/api/v1/data/cache"
