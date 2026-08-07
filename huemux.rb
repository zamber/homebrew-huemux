class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-darwin-arm64",
      using: :nounzip
  sha256 "06dff32297ae5f6e512b112d450b88c02e1eaee48c19b0eafe924cb5007c0281"
  version "0.0.4-alpha.7"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-darwin-amd64",
          using: :nounzip
      sha256 "4784e73654a77608fca90631ced9700abe1607b7fa0c437ade5fbfd9cc1dc287"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-linux-amd64",
          using: :nounzip
      sha256 "fe71a20804d62f3e1c864ac7690551a3f5257b55cb9f817ac152d00a0e8f9b5d"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-linux-arm64",
          using: :nounzip
      sha256 "5329876167c5f7ef3fd68082e26a5321ede1402f91092176c2f73e1ac881a1d5"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
