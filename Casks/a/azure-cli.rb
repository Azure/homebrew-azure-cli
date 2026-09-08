cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.90.0"
  sha256 arm:          "b6bdc84754fbfd772d1e39a4bea07602ca22e62489d14512d124432733aff7b1",
         intel:        "88a601ece8daf25df7a0e97a26ef1621335cfa061f4f41e434cef75d60af323f",
         arm64_linux:  "f727beed9bc4b01eafbe270c592950da15b1cccc8b49e89c639920546fc4e7fe",
         x86_64_linux: "e7db0c30b80531304ab504ef98414882f970241082913a8b30f74e27e74dcb5e"

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
