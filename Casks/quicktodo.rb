cask "quicktodo" do
  version "0.1.4"
  sha256 "6d5a2cfb23f38a1c70da095481c9f28a3ef198b1f58d6e607b17eeb140af39b6"

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
