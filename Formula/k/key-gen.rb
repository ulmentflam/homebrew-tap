class KeyGen < Formula
  desc "key-gen is a CLI tool to generate keys for various blockchains"
  homepage "https://github.com/ulmentflam/key-gen"
  license "GPLv3"
  url "https://github.com/ulmentflam/key-gen/releases/download/v0.0.1/key-gen-v0.0.1-darwin-arm64.tar.gz"
  sha256 "ece24db297b3afea1dc560e69897bbedded429db2dd6f845fb4bfcf44f410c81"
  def install
    bin.install "key-gen"
  end
end
