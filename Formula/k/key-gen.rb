class KeyGen < Formula
  desc "Generate keys for various blockchains"
  homepage "https://github.com/ulmentflam/key-gen"
  url "https://github.com/ulmentflam/key-gen/releases/download/v0.0.2/key-gen-v0.0.2-darwin-arm64.tar.gz"
  sha256 "8881d1bca3adb274a4a1de09e98765a9d0113f84f8992b107ca5c01325bd5c0b"
  license "GPL-3.0-or-later"

  def install
    bin.install "key-gen"
  end
end
