cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.90.0"
  sha256 arm:          "ee1d7dd55b09d2cfee48a9006cc742070f92d17e8dd0e0f4b10f569f189b24d4",
         intel:        "bb0de74470964219740fe40a88db1bf5d191281a12cb5de6bcd4b72f208d9359",
         arm64_linux:  "eba5fcc1d7a0fe89f9500dbcc524d52c1d41acce160f6580b5cd71203abc9cc9",
         x86_64_linux: "433190272a19be868cfea1805c2b532433963231700dc1073b5c03f9ed656dad"

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
