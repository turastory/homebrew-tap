#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${1:?version is required, e.g. 0.1.0}"
SHA256="${2:?sha256 is required}"
RELEASE_TAG="${3:-v$VERSION}"
APP_REPO="${4:-turastory/quickcommand}"
FORMULA_NAME="${5:-qc}"
ASSET_NAME="${6:-qc-aarch64-apple-darwin.tar.gz}"
OUTPUT_PATH="${7:-$ROOT_DIR/Formula/$FORMULA_NAME.rb}"

cat > "$OUTPUT_PATH" <<EOF
class Qc < Formula
  desc "Local-first natural language shell assistant for macOS"
  homepage "https://github.com/$APP_REPO"
  url "https://github.com/$APP_REPO/releases/download/$RELEASE_TAG/$ASSET_NAME"
  sha256 "$SHA256"

  depends_on macos: :ventura

  def install
    odie "qc currently supports Apple Silicon macOS only." unless Hardware::CPU.arm?
    bin.install "qc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qc --version")
  end
end
EOF

echo "Rendered $OUTPUT_PATH"
