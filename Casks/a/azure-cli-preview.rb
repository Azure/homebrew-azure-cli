cask "azure-cli-preview" do
  arch arm: "arm64", intel: "x86_64"

  version "2.86.0"
  sha256 arm:   "c20891b31a66748a1019c93e0181e4c7e29d63f54931ca092f0b8e2a50525413",
         intel: "00d79370715730ddd4b6c766873b2990480be3ecaa03f8d45a345b7329c45eac"

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
