cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.90.0"
  sha256 arm:          "75b37d706c9176c9f7aec1f2fdc039ac01c6c9e35ad2561fc313d36431ec25b5",
         intel:        "a48909b428d09ddbb5273d1683e4056059f99bf2d6e412811e2ee9e87ff935f3",
         arm64_linux:  "e65e666b7c9c875d3e791f75014e1c592da6c8bc169649d01a4a22859104a1b0",
         x86_64_linux: "010c69c7d6b4f8228d401977834f54b9adb686a105653c9095e91fbc4fc3a889"

  url "https://github.com/Azure/homebrew-azure-cli/releases/download/azure-cli-#{version}/azure-cli-#{version}-#{os}-#{arch}.tar.gz"
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
