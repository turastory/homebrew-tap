class Qc < Formula
  desc "Local-first natural language shell assistant for macOS"
  homepage "https://github.com/turastory/quickcommand"
  url "https://github.com/turastory/quickcommand/releases/download/v0.1.2/qc-aarch64-apple-darwin.tar.gz"
  sha256 "a1a43ba649c5a8b919d2b3a2a3bfdabdeab3a4796d3bb6535717ed535603a0d5"

  depends_on macos: :ventura

  def install
    odie "qc currently supports Apple Silicon macOS only." unless Hardware::CPU.arm?
    bin.install "qc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qc --version")
  end
end
