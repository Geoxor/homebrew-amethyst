cask "amethyst-player" do
  arch arm: "-arm64", intel: ""

  version "2.1.3"

  on_arm do
    sha256 "cd70b290f4cdd3ba20982effea18c616526ed14d08664004abc7f00e39318a64"

    depends_on macos: ">= :big_sur"
  end
  on_intel do
    sha256 "fc122552727001c48ff2f448b37fcf86502342253dac75c315675ac934933f6f"

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
