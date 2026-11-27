cask "keybridge" do
  version "1.1.0"
  sha256 "ece0931ae52f0f10a8ef194dc0ce7169b913267f895669e565f26ac4a76139fd"

  url "https://github.com/emajidov/keybridge/releases/download/v#{version}/KeyBridge.dmg"
  name "KeyBridge"
  desc "Use Windows and Linux Ctrl keyboard shortcuts on a Mac"
  homepage "https://emajidov.github.io/keybridge/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "KeyBridge.app"

  uninstall quit: "io.github.keybridge.KeyBridge"

  zap trash: "~/Library/Preferences/io.github.keybridge.KeyBridge.plist"

  caveats <<~EOS
    KeyBridge is not notarized by Apple. The first time you open it, macOS blocks it:
    open System Settings → Privacy & Security and click "Open Anyway".

    Then allow KeyBridge under System Settings → Privacy & Security → Accessibility.
  EOS
end
