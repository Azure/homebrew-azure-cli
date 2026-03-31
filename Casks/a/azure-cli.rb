cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos"

  version "2.85.0"
  sha256 arm:   "6f69aedbc1b217e71f28fa6e344b46acb6b9bf72370c3a98130198781938aabc",
         intel: "fe4b0d18bdfcbbd96ee0d13481fb73a4631b7657fac858390aa585a8fd892548"

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
  zsh_completion "completions/zsh/_az"
  bash_completion "completions/bash/az"
  fish_completion "completions/fish/az.fish"

  zap trash: "~/.azure"
end
