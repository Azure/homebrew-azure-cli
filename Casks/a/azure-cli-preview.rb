cask "azure-cli-preview" do
  arch arm: "arm64", intel: "x86_64"

  version "2.87.0"
  sha256 arm:   "b1f8b777a928427def444a8d35e345a305595dd8c694912ab20a6bfd212b2009",
         intel: "9dc324e3e9a87ef76f2abc0d0fad2b54300b38769d199bbf58fc000a218cba0b"

  url "https://github.com/Azure/azure-cli/releases/download/azure-cli-#{version}/azure-cli-#{version}-macos-#{arch}.tar.gz",
      verified: "github.com/Azure/azure-cli/"
  name "Azure CLI"
  desc "Microsoft Azure CLI 2.0"
  homepage "https://docs.microsoft.com/cli/azure/overview"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "python@3.13"

  binary "bin/az"
  bash_completion "completions/bash/az"
  fish_completion "completions/fish/az.fish"
  zsh_completion "completions/zsh/_az"

  zap trash: "~/.azure"
end
