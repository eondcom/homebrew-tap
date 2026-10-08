cask "localman" do
  version "0.1.1"
  sha256 "d83a128c59c10f84c1ca5ab7dbede849423d84e611802297b26568b309a5f039"

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
