cask "azure-cli-preview" do
  arch arm: "arm64", intel: "x86_64"

  version "2.88.0"
  sha256 arm:   "f97865d9300522481e39cd016005fc2fe0a35d8a8900e9ddc77c6f75984ffea9",
         intel: "b50714213c46f354ac176f92fc5d6162e87525b3de6c893b00bbfa2eadb5f6b2"

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
