#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FORMULA_PATH="${1:-$ROOT_DIR/Formula/qc.rb}"
FORMULA_NAME="${2:-qc}"
TAP_NAME="${3:-turastory/local-tap}"
TAP_OWNER="${TAP_NAME%%/*}"
TAP_REPO_SUFFIX="${TAP_NAME#*/}"
TAP_DIR="$(brew --repository)/Library/Taps/$TAP_OWNER/homebrew-$TAP_REPO_SUFFIX"
FULL_FORMULA_NAME="$TAP_NAME/$FORMULA_NAME"

cleanup() {
  brew uninstall --formula --force "$FORMULA_NAME" >/dev/null 2>&1 || true
  rm -rf "$TAP_DIR"
}
trap cleanup EXIT

rm -rf "$TAP_DIR"
mkdir -p "$TAP_DIR/Formula"
cp "$FORMULA_PATH" "$TAP_DIR/Formula/$FORMULA_NAME.rb"

brew audit --strict "$FULL_FORMULA_NAME"
brew install "$FULL_FORMULA_NAME"

BREW_BIN="$(brew --prefix)/bin/qc"

if [[ ! -x "$BREW_BIN" ]]; then
  echo "Installed qc binary was not found on PATH" >&2
  exit 1
fi

"$BREW_BIN" --version
brew uninstall --formula "$FULL_FORMULA_NAME"

echo "Validated $FORMULA_NAME"
