class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-darwin-arm64",
      using: :nounzip
  sha256 "98a97c2de4e4320f2b7f95f5c708d1d4f69b5c2c7bcfee6ed908281913f7ca5e"
  version "0.0.2-alpha.35"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-darwin-amd64",
          using: :nounzip
      sha256 "3af761b7b6d9b178eea7fe7950552f8b3750e4d6f5b6f64ab066d0306dce1066"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-linux-amd64",
          using: :nounzip
      sha256 "793fa271e63dd89c4c17ade11d4c5b346e5b7c7ae4a296f51be9653faa6e17c5"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-linux-arm64",
          using: :nounzip
      sha256 "cf70ad4937566042231931b18469db1e2e196988d712cc062a6e9336df2c7e94"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
