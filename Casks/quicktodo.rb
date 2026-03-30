cask "quicktodo" do
  version "0.1.7"
  sha256 "a9ec5b773dd7cf0ac9b73858e588be0f949a1b4f19b85f42a3f10b9cad595ed0"

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
