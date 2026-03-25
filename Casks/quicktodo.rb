cask "quicktodo" do
  version "0.1.2"
  sha256 "824a674b3e0b1194720d83ec29f16e146597a58212798a01e5d7659b1511120f"

  url "https://github.com/turastory/quicktodo/releases/download/v#{version}/QuickTodo.zip"
  name "QuickTodo"
  desc "Single-file Markdown todo panel for macOS"
  homepage "https://github.com/turastory/quicktodo"

  app "QuickTodo.app"
end
