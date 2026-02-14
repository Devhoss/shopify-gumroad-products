#!/usr/bin/env bash
# build-zip.sh <product-dir>
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <product-dir>"
  exit 1
fi

PRODUCT="$1"
RELEASES="$PRODUCT/releases"
mkdir -p "$RELEASES"

VERSION="v1.0.0"
ZIPNAME="$(basename "$PRODUCT")-$VERSION.zip"

cd "$PRODUCT"

zip -r "$RELEASES/$ZIPNAME" . \
  -x "*.git*" "node_modules/*" "*.log" "*.DS_Store" "*~" "#*" "*/.DS_Store" "*/.gitignore" "*/.git/*" "releases/*"

echo "Created zip: $RELEASES/$ZIPNAME"
