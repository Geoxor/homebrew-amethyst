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

  zap trash: [
    "~/Library/Application Support/Amethyst"
  ]
end
