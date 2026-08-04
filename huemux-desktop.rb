class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "bdb64ff10b241477b72a4e3412b9a7dca9a3f12cff1fe0b65ef7c9d0c7bd22e0"
  version "0.0.2-alpha.35"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "4fb75d46a1b0e1a4cdf34e1fc4204f0cf16b453f0f5f60e6a3c7bfefc3bd7da8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "ac0bb8c88185ff51a0dfef3ae93f22f82a06ab41c34c7ece3bd112ad791720d0"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.35/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "5c4933b1e1002b3ac71272e5106088279138f2d389227af2ce750cdef68b83f9"
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
