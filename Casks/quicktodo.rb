cask "quicktodo" do
  version "0.1.10"
  sha256 "fa82ab26cd196536e3e77781492be8749fbbd1c6f33806ff0c9e74291772c7d6"

  url "https://github.com/turastory/quicktodo/releases/download/v#{version}/QuickTodo.zip"
  name "QuickTodo"
  desc "Single-file Markdown todo panel for macOS"
  homepage "https://github.com/turastory/quicktodo"

  livecheck do
    url "https://github.com/turastory/quicktodo"
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "QuickTodo.app"

  zap trash: [
    "~/Library/Preferences/com.turastory.quicktodo.plist",
    "~/Library/Saved Application State/com.turastory.quicktodo.savedState",
  ]
end
