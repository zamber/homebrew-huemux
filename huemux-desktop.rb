class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "9ed4a6a120f289fd8d057411bbd91bf5a143d79e369b363192f3da2516a79dfa"
  version "0.0.5-alpha.6"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "843a78a464e61b478f4d2867575b8d1626e69dd036810c9d212edb83c281baaf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "39e3e014eb321791910a4dd7d85af470ca25932a621f12d2126fcbdc6bb0f3a5"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "69bfd818855faf2cad65e734319e061c2c5a52bf5598961ec33477ac93d15c0e"
    end
  end

  def install
    bin.install Dir["huemux-desktop-*"].first => "huemux-desktop"
  end

  def caveats
    <<~EOS
      First launch downloads Electron (~150MB) into your OS cache directory
      (needs internet access once, cached after that).
    EOS
  end

  test do
    assert_match "huemux-desktop", shell_output("#{bin}/huemux-desktop --help 2>&1")
  end
end
