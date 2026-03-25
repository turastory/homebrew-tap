cask "quicktodo" do
  version "0.1.3"
  sha256 "fdfda03a069c5ab9c40cca04f7b713d34d5beb923e8ac0e7a4f0ab619e04d8ff"

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
