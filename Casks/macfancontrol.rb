cask "macfancontrol" do
  version "2.4.2"
  sha256 "132c7bcf94a50d65b80f2c82a0e28f789f84b5c3a6817e1b4f4c745d67a41ae5"

  url "https://github.com/eondcom/mac-fan-control/releases/download/v#{version}/MacFanControl.dmg"
  name "MacFanControl"
  desc "Fan, power and thermal manager for Intel MacBooks"
  homepage "https://github.com/eondcom/mac-fan-control"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "MacFanControl.app"

  uninstall quit: "com.eond.macfancontrol"

  zap delete: "/Library/PrivilegedHelperTools/com.eond.macfancontrol.smc",
      trash:  [
        "~/Library/Application Support/MacFanControl",
        "~/Library/Caches/com.eond.macfancontrol",
        "~/Library/Preferences/com.eond.macfancontrol.plist",
      ]

  caveats <<~EOS
    MacFanControl is not signed by Apple. On first launch, right-click the app
    and choose Open, or allow it in System Settings > Privacy & Security.
  EOS
end
