cask "amethyst-player" do
  arch arm: "-arm64", intel: ""

  version "2.1.7"
  sha256 :no_check

  on_arm do
    depends_on macos: ">= :big_sur"
  end
  on_intel do
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

    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "-s", "-", "#{appdir}/Amethyst.app"],
                   sudo: true
  end

  zap trash: "~/Library/Application Support/Amethyst"
end
