cask "amethyst-player" do
  arch arm: "-arm64", intel: ""

  version "2.1.4"

  on_arm do
    sha256 "0511b86871fa01bc5c25b0ab0edbb2928926983faa184b8ad3c537779ae9aaee"

    depends_on macos: ">= :big_sur"
  end
  on_intel do
    sha256 "3237fd57387cf4ce7e6bea0252bd6e4c468ae2e7bd4d853d288dd3951ef4da6d"

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
