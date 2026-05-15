cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"

  version "2.86.0"
  sha256 arm:   "29d04efd23cce6be6c911c0bfd6cf6969b62146ae3100231979cddd2f5a3cfe1",
         intel: "38025d21d88208c5f38796c18e8653fffb7aa9217cf696a5af7bb264c13d2c90"

  url "https://github.com/naga-nandyala/azure-cli-broker-new/releases/download/azure-cli-#{version}/azure-cli-#{version}-macos-#{arch}.tar.gz",
      verified: "github.com/naga-nandyala/azure-cli-broker-new/"
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
