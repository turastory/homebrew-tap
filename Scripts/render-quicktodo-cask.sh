#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${1:?version is required, e.g. 0.1.2}"
SHA256="${2:?sha256 is required}"
RELEASE_TAG="${3:-v$VERSION}"
APP_REPO="${4:-turastory/quicktodo}"
APP_NAME="${5:-QuickTodo}"
CASK_TOKEN="${6:-quicktodo}"
MIN_MACOS="${7:-ventura}"
OUTPUT_PATH="${8:-$ROOT_DIR/Casks/$CASK_TOKEN.rb}"
RELEASE_PATH_SEGMENT="$RELEASE_TAG"

if [[ "$RELEASE_TAG" == "v$VERSION" ]]; then
  RELEASE_PATH_SEGMENT='v#{version}'
fi

cat > "$OUTPUT_PATH" <<EOF
cask "$CASK_TOKEN" do
  version "$VERSION"
  sha256 "$SHA256"

  url "https://github.com/$APP_REPO/releases/download/$RELEASE_PATH_SEGMENT/$APP_NAME.zip"
  name "$APP_NAME"
  desc "Single-file Markdown todo panel for macOS"
  homepage "https://github.com/$APP_REPO"

  livecheck do
    url "https://github.com/$APP_REPO"
    strategy :github_latest
  end

  depends_on macos: ">= :$MIN_MACOS"

  app "$APP_NAME.app"

  zap trash: [
    "~/Library/Preferences/com.turastory.quicktodo.plist",
    "~/Library/Saved Application State/com.turastory.quicktodo.savedState",
  ]
end
EOF

echo "Rendered $OUTPUT_PATH"
