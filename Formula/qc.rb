class Qc < Formula
  desc "Local-first natural language shell assistant for macOS"
  homepage "https://github.com/turastory/quickcommand"
  url "https://github.com/turastory/quickcommand/releases/download/v0.1.0/qc-aarch64-apple-darwin.tar.gz"
  sha256 "3dcecfe24b1dae895f0453af62341c9341bd65685859e13f3abec8176cf4e4f6"

  depends_on macos: :ventura

  def install
    odie "qc currently supports Apple Silicon macOS only." unless Hardware::CPU.arm?
    bin.install "qc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/qc --version")
  end
end
