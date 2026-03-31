cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos"

  version "2.84.0"
  sha256 arm:   "cdb13cd063d6fac933ed335414f8053f85304dfc9d9187e047af777e4d3842d5",
         intel: "d6e21826ace7371094deac36d7956dadd806fdd71b97c8c7bdb6c6be105277a1"

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
