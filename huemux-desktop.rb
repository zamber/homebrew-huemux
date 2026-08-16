class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "f41f00f4b72798ec3021af3f2ac0777549735a919665a377ac0069cba83d0b7e"
  version "0.0.4-alpha.9"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "8c055786d1b76451b77c73fbcce429685d013d91429afc2814c28024051e288f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "353c1a9d00f6c7abcd05735a441c480b6183fca3a2426fe14877263b6a61599d"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "dfc5ae727bd53412e092c2b28a72c13ab95b1c1892b31cfe0b7791c0fc6f3f73"
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
