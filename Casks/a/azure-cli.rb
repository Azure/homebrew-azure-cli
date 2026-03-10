cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos"

  version "2.84.0"
  sha256 arm:   "5d13beb2808c0b7cf88b56b5d6f0c2465ad7f1cf8b77837a8ee0addac05a29d8",
         intel: "add794b1181e77e37e1ec8a8121496066ff333f2c650a476c20843c00e2fc148"

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
