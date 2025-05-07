cask "amethyst@bin" do
  arch arm: "-arm64", intel: ""
  version "2.1.1"
  sha256 :no_check

  url "https://github.com/Geoxor/Amethyst/releases/download/v#{version}/Amethyst-#{version}#{arch}.dmg"
  name "Amethyst"
  desc "Cross-platform audio player with a node-based audio routing system"
  homepage "https://amethyst.geoxor.moe/"

  livecheck do
    url :url
    strategy :github_releases
  end

  depends_on macos: ">= :big_sur"

  app "Amethyst.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-d", "com.apple.quarantine", "#{appdir}/Amethyst.app"],
      sudo: true
  end

  zap trash: [
    "~/Library/Application Support/Amethyst",
  ]
end
