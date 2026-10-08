cask "localman" do
  version "0.1.0"
  sha256 "7279e28a0c44318783dc910a00153dc753bb0af4e912a920bf3951c6b99f0af3"

  url "https://github.com/eondcom/localman/releases/download/v#{version}/LocalMan-#{version}.dmg"
  name "LocalMan"
  desc "Local web development environment manager (Apache, PHP, MySQL, HTTPS)"
  homepage "https://github.com/eondcom/localman"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "LocalMan.app"

  uninstall quit: "com.eond.localman"

  zap trash: [
    "~/Library/Application Support/localman",
    "~/Library/Preferences/com.eond.localman.plist",
    "~/Library/Saved Application State/com.eond.localman.savedState",
  ]

  caveats <<~EOS
    LocalMan is not signed by Apple. On first launch, right-click the app
    and choose Open, or allow it in System Settings > Privacy & Security.

    To manage Apache and /etc/hosts without a password prompt every time, run once:
      sudo /Applications/LocalMan.app/Contents/Resources/install-sudoers.sh
  EOS
end
