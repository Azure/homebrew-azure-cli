cask "azure-cli-preview" do
  arch arm: "arm64", intel: "x86_64"

  version "2.89.1"
  sha256 arm:   "1e1e9b30d8933167545abb97b99c9b9e86f54514fcb522161cc375134338a229",
         intel: "deaf768bba6943a9872c76ecd6e6e0a38cf97d810d8c152ba82a2556ecc8d703"

  url "https://github.com/Azure/azure-cli/releases/download/azure-cli-#{version}/azure-cli-#{version}-macos-#{arch}.tar.gz",
      verified: "github.com/Azure/azure-cli/"
  name "Azure CLI"
  desc "Microsoft Azure CLI 2.0"
  homepage "https://docs.microsoft.com/cli/azure/overview"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "python@3.14"

  binary "bin/az"
  bash_completion "completions/bash/az"
  fish_completion "completions/fish/az.fish"
  zsh_completion "completions/zsh/_az"

  zap trash: "~/.azure"
end
