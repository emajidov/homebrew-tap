cask "keybridge" do
  version "1.1.0"
  sha256 "ece0931ae52f0f10a8ef194dc0ce7169b913267f895669e565f26ac4a76139fd"

  url "https://github.com/emajidov/keybridge/releases/download/v#{version}/KeyBridge.dmg"
  name "KeyBridge"
  desc "Remaps Windows and Linux Ctrl keyboard shortcuts to Command shortcuts"
  homepage "https://emajidov.github.io/keybridge/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "KeyBridge.app"

  # KeyBridge is ad-hoc signed and not notarized; clear the quarantine flag so it opens without a Gatekeeper block.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/KeyBridge.app"]
  end

  uninstall quit: "io.github.keybridge.KeyBridge"

  zap trash: "~/Library/Preferences/io.github.keybridge.KeyBridge.plist"

  caveats <<~EOS
    KeyBridge is not notarized by Apple. This cask removes the quarantine flag so it opens
    without a Gatekeeper warning.

    Allow KeyBridge under System Settings → Privacy & Security → Accessibility.
  EOS
end
