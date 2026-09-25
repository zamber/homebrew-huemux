class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "65c1272a4be553220943fbec15c85233a95a32f256da013d1c5c9a492404065b"
  version "0.0.5-alpha.5"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "0b02e72c0449ab28f14e1a25601dee584bdfc93cdc8da60aa6ae72e90449e82f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "d3e6f814dd9872e5acd6d074d197507b0d6c41f72c48cca9703c5d2c91ab3662"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "ea94af137aa82dbcf4545eb4b952e6850bbe826597614abeadff8fbbab8d4ef5"
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
