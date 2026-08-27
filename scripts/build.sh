#!/usr/bin/env bash
#
# Build the system archive from the files currently on disk.
#
# Usage:
#   ./scripts/build.sh dnd5e.system
#   ./scripts/build.sh /tmp/builds/dnd5e.system
#
# The output path is taken verbatim from the first argument; relative paths
# resolve against the directory you ran the script from, not the repo root.
#
# Packaging files are left out of the archive: the paths marked `export-ignore`
# in .gitattributes (so this matches what the Release workflow ships), plus
# version-control and macOS clutter.

set -euo pipefail

OUTPUT="${1:-}"

if [ -z "$OUTPUT" ] || [ "$OUTPUT" = "-h" ] || [ "$OUTPUT" = "--help" ]; then
  echo "usage: $0 <output-file>" >&2
  exit 1
fi

# Resolve the output against the caller's directory before moving to the repo.
case "$OUTPUT" in
  /*) ;;
   *) OUTPUT="$PWD/$OUTPUT" ;;
esac

cd "$(dirname "$0")/.."

SYSTEM_ID=$(jq -r '.id' manifest.json)
VERSION=$(jq -r '.version' manifest.json)
SYSTEM_VERSION=$(jq -r '.version' system.json)
DOWNLOAD=$(jq -r '.download' manifest.json)
REPO_URL=$(jq -r '.repository' system.json)
EXPECTED_DOWNLOAD="${REPO_URL%/}/releases/download/${VERSION}/${SYSTEM_ID}.system"

# The same consistency the Release workflow demands of a tagged commit.
fail=0
if [ "$SYSTEM_VERSION" != "$VERSION" ]; then
  echo "version mismatch: manifest.json is '${VERSION}', system.json is '${SYSTEM_VERSION}'" >&2
  fail=1
fi
if [ "$DOWNLOAD" != "$EXPECTED_DOWNLOAD" ]; then
  echo "manifest.json download is '${DOWNLOAD}', expected '${EXPECTED_DOWNLOAD}'" >&2
  fail=1
fi
[ "$fail" -eq 0 ] || exit 1

# Always-excluded clutter, then everything .gitattributes marks export-ignore
# so the two exclusion lists cannot drift apart.
EXCLUDES=( '.git/*' '*/.DS_Store' '.DS_Store' '*/._*' '._*' )

while read -r pattern attrs; do
  case "$attrs" in
    *export-ignore*) ;;
    *) continue ;;
  esac
  case "$pattern" in
    */) EXCLUDES+=( "${pattern}*" ) ;;   # directory: exclude its contents
     *) EXCLUDES+=( "$pattern" ) ;;
  esac
done < <(grep -v '^\s*#' .gitattributes | grep -v '^\s*$')

mkdir -p "$(dirname "$OUTPUT")"
rm -f "$OUTPUT"

zip -qr -X "$OUTPUT" . -x "${EXCLUDES[@]}"

echo "${SYSTEM_ID} ${VERSION}"
echo "  excluded: ${EXCLUDES[*]}"
unzip -l "$OUTPUT" | tail -1
ls -lh "$OUTPUT" | awk '{print "  " $5, $NF}'
