cask "amethyst-player" do
  arch arm: "-arm64", intel: ""

  version "2.1.7"
  
  on_arm do
    sha256 "72ff1f2539aefb08467b03a33027fb7ad8c09a682fcde5430148a3f0d8138339"
    depends_on macos: ">= :big_sur"
  end
  on_intel do
    sha256 "bea271807ef9d087a403db440d499d441319e39ae240014072c6c66d87c3628b"
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
