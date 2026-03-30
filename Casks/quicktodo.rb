cask "quicktodo" do
  version "0.1.8"
  sha256 "a31f6943a10f42f7f32190281ebd493991f461e1e320f6594a16ab6dc7fc1fff"

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
