cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos"

  version "2.84.0"
  sha256 arm:   "b99dcd7376d5abf60e1118ce1d461941bb0421893f1e23f3b4fc0c8dba7627ed",
         intel: "96c3312d2decd7002e9d2bf97c37b1c27f1972b16ad17af4fd9e1c2d57daa73c"

  url "https://github.com/Azure/homebrew-azure-cli/releases/download/azure-cli-#{version}/azure-cli-#{version}-#{os}-#{arch}.tar.gz"
  name "Azure CLI"
  desc "Microsoft Azure CLI 2.0"
  homepage "https://docs.microsoft.com/cli/azure/overview"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "python@3.13"

  binary "bin/az"

  zap trash: "~/.azure"
end
