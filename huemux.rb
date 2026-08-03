class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-darwin-arm64",
      using: :nounzip
  sha256 "d8f5db139ae96acdbb9687e46e74ee9c229874420d89c21ff04be4e3d97584db"
  version "0.0.2-alpha.26"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-darwin-amd64",
          using: :nounzip
      sha256 "4f3a70870c34d9f3caafae8fbec1f5156223a52009b8fb347d074477085010d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-linux-amd64",
          using: :nounzip
      sha256 "5fd6762dab69398116864bff8158ee4f964640ffc141a1c8a00cb52696b0859a"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-linux-arm64",
          using: :nounzip
      sha256 "5a7a26627a8be74887a6534b92dbabfd899895e9223ff08957f01173191b7092"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
