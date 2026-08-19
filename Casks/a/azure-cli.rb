cask "azure-cli" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "2.89.1"
  sha256 arm:          "9f8bab075888d683699343d55ebdf31b6bae9c569d4632f45d6676b21637eb7e",
         intel:        "2254dc138d7edfd3051eb60c653c1b67e56ca812abe89943aa046d9b3c03e449",
         arm64_linux:  "0995de354d8d7da02f9ec62c44551a39079c37a4494a69716c61a491d7fd2fa9",
         x86_64_linux: "92968818a7e1943614f0aaccef811aae7f932bfe7149d43e7321452eaed4a966"

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
