#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CASK_PATH="${1:-$ROOT_DIR/Casks/quicktodo.rb}"
CASK_TOKEN="${2:-quicktodo}"
APP_NAME="${3:-QuickTodo}"
TAP_NAME="${4:-turastory/local-tap}"
APP_PATH="/Applications/$APP_NAME.app"
PLIST_PATH="$APP_PATH/Contents/Info.plist"
FULL_CASK_NAME="$TAP_NAME/$CASK_TOKEN"

cleanup() {
  brew uninstall --cask --force "$FULL_CASK_NAME" >/dev/null 2>&1 || true
  brew uninstall --cask --force "$CASK_TOKEN" >/dev/null 2>&1 || true
  brew untap "$TAP_NAME" >/dev/null 2>&1 || true
}
trap cleanup EXIT

EXPECTED_VERSION="$(sed -n 's/^  version "\(.*\)"/\1/p' "$CASK_PATH")"

if [[ -z "$EXPECTED_VERSION" ]]; then
  echo "Unable to determine expected version from $CASK_PATH" >&2
  exit 1
fi

brew untap "$TAP_NAME" >/dev/null 2>&1 || true
brew tap --custom-remote "$TAP_NAME" "$ROOT_DIR"
brew audit --cask --online "$FULL_CASK_NAME"
brew reinstall --cask --require-sha "$FULL_CASK_NAME"

if [[ ! -f "$PLIST_PATH" ]]; then
  echo "Missing Info.plist at $PLIST_PATH" >&2
  exit 1
fi

ACTUAL_VERSION="$(/usr/libexec/PlistBuddy -c 'Print :CFBundleShortVersionString' "$PLIST_PATH")"

if [[ "$ACTUAL_VERSION" != "$EXPECTED_VERSION" ]]; then
  echo "Version mismatch: expected $EXPECTED_VERSION, got $ACTUAL_VERSION" >&2
  exit 1
fi

brew uninstall --cask "$FULL_CASK_NAME"

echo "Validated $CASK_TOKEN $EXPECTED_VERSION"
