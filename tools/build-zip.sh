#!/usr/bin/env bash
# build-zip.sh <product-dir>
# Packages the product folder into a Gumroad‑ready zip, excluding junk.
set -e
if [ -z "$1" ]; then
  echo "Usage: $0 <product-dir>"
  exit 1
fi
PRODUCT="$1"
RELEASES="$PRODUCT/releases"
mkdir -p "$RELEASES"
ZIPNAME=$(basename "$PRODUCT")-v1.0.0.zip
# Exclude .git, node_modules, *.log, *.DS_Store, etc.
zip -r "$RELEASES/$ZIPNAME" "$PRODUCT" -x "*.git*" "node_modules/*" "*.log" "*.DS_Store" "*~" "#*" "*/.DS_Store" "*/.gitignore" "*/.git/*"

echo "Created zip: $RELEASES/$ZIPNAME"
