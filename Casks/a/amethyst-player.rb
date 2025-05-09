cask "amethyst-player" do
  arch arm: "-arm64", intel: ""

  version "2.1.2"

  on_arm do
    sha256 "3c743301a9a5547e787d5e7ddb3dadc17d9c747e4f85a0b18091b6fc6c09010e"
    depends_on macos: ">= :big_sur"
  end
  on_intel do
    sha256 "c8e02048c1de7ee36d625192b474bc13bd01dbed3cae01f2f12e9e27eac42914"
    depends_on macos: ">= :mojave"
  end

  url "https://github.com/Geoxor/Amethyst/releases/download/v#{version}/Amethyst-#{version}#{arch}.dmg"
  name "Amethyst"
  desc "Cross-platform audio player with a node-based audio routing system"
  homepage "https://github.com/Geoxor/Amethyst"

  livecheck do
    url :url
    strategy :github_releases
  end

  app "Amethyst.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Amethyst.app"],
                   sudo: true
  end

  zap trash: "~/Library/Application Support/Amethyst"
end
