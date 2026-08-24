#!/usr/bin/env bash
#
# Bump the system version in manifest.json and system.json, and keep the
# release download URL in manifest.json in sync with it.
#
# Usage:
#   ./scripts/bump-version.sh 0.9.16            # edit files only
#   ./scripts/bump-version.sh 0.9.16 --commit   # + git commit
#   ./scripts/bump-version.sh 0.9.16 --tag      # + git commit + annotated tag
#
# Push the tag to trigger the Release workflow:
#   git push origin main && git push origin 0.9.16

set -euo pipefail

cd "$(dirname "$0")/.."

VERSION="${1:-}"
MODE="${2:-}"

if [[ ! "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "usage: $0 <major.minor.patch> [--commit|--tag]" >&2
  exit 1
fi

SYSTEM_ID=$(jq -r '.id' manifest.json)
REPO_URL=$(jq -r '.repository' system.json)
REPO_URL="${REPO_URL%/}"
DOWNLOAD="${REPO_URL}/releases/download/${VERSION}/${SYSTEM_ID}.system"

OLD_VERSION=$(jq -r '.version' manifest.json)

# Targeted in-place edits: keep each file's existing hand-written formatting
# instead of reserialising it with jq.
perl -0pi -e "s{(\"version\"\s*:\s*\")[^\"]*(\")}{\${1}${VERSION}\${2}}" manifest.json system.json
perl -0pi -e "s{(\"download\"\s*:\s*\")[^\"]*(\")}{\${1}${DOWNLOAD}\${2}}" manifest.json

# Re-read and validate exactly what the Release workflow checks.
[ "$(jq -r '.version' manifest.json)" = "$VERSION" ] || { echo "manifest.json version not updated" >&2; exit 1; }
[ "$(jq -r '.version' system.json)"   = "$VERSION" ] || { echo "system.json version not updated" >&2; exit 1; }
[ "$(jq -r '.download' manifest.json)" = "$DOWNLOAD" ] || { echo "manifest.json download not updated" >&2; exit 1; }

echo "${OLD_VERSION} -> ${VERSION}"
echo "  manifest.json: version, download"
echo "  system.json:   version"
echo "  download:      ${DOWNLOAD}"

case "$MODE" in
  --commit)
    git add manifest.json system.json
    git commit -m "Bump version to ${VERSION}"
    ;;
  --tag)
    git add manifest.json system.json
    git commit -m "Bump version to ${VERSION}"
    git tag -a "${VERSION}" -m "${VERSION}"
    echo
    echo "Next: git push origin HEAD && git push origin ${VERSION}"
    ;;
  "")
    echo
    echo "Next: review, commit, then tag ${VERSION} and push."
    ;;
  *)
    echo "unknown option: ${MODE}" >&2
    exit 1
    ;;
esac
