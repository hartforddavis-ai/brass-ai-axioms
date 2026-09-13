#!/usr/bin/env bash
# Syncs this site into its hosted subpath under Crucible Labs.
#
# Why this exists: Brass AI Axioms has no Netlify deploy of its own yet, so
# it's hosted as a copied-in subpath of the crucible repo (same pattern as
# Pile Burn) rather than proxied. That means two independent copies of
# index.html + assets exist on disk, and editing one without the other
# silently drifts. This script is the one-command fix for that: it always
# copies FROM this repo (source of truth) INTO the crucible port, and
# rewrites the root-absolute asset paths to the subpath the port actually
# lives at. It does not commit or push either repo — review the diff first.
#
# Usage:
#   scripts/sync-to-crucible.sh [path-to-crucible-repo]
# Default crucible path assumes the usual sibling layout:
#   .../SOFTWARE/Shearpin  (this repo)
#   .../SOFTWARE/Crucible  (default target)

set -euo pipefail

SUBPATH="brass-ai-axioms"

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CRUCIBLE_DIR="${1:-$(cd "$SOURCE_DIR/../Crucible" 2>/dev/null && pwd || true)}"

if [[ -z "$CRUCIBLE_DIR" || ! -d "$CRUCIBLE_DIR" ]]; then
  echo "error: crucible repo not found. Pass its path explicitly:" >&2
  echo "  scripts/sync-to-crucible.sh /path/to/crucible" >&2
  exit 1
fi

if [[ ! -f "$SOURCE_DIR/index.html" ]]; then
  echo "error: $SOURCE_DIR/index.html not found — wrong source dir?" >&2
  exit 1
fi

DEST="$CRUCIBLE_DIR/$SUBPATH"
mkdir -p "$DEST/assets"

echo "Syncing $SOURCE_DIR -> $DEST"

# Assets: mirror exactly, removing anything the source no longer ships.
rsync -a --delete "$SOURCE_DIR/assets/" "$DEST/assets/"

# index.html: copy, then rewrite root-absolute paths to the subpath, then
# drop the manifest link (the port has no manifest of its own — matches
# Pile Burn's pattern of a self-contained page with no shared manifest).
cp "$SOURCE_DIR/index.html" "$DEST/index.html"

python3 - "$DEST/index.html" "$SUBPATH" <<'PY'
import re, sys
path, subpath = sys.argv[1], sys.argv[2]
s = open(path).read()
s = re.sub(r'(?<!/{subpath}/)/assets/'.format(subpath=re.escape(subpath)),
            f'/{subpath}/assets/', s)
s = re.sub(r'\n<link rel="manifest"[^>]*>\n?', '\n', s)
open(path, 'w').write(s)
PY

echo "Done. Review the diff before committing:"
echo "  cd \"$CRUCIBLE_DIR\" && git diff -- $SUBPATH"
