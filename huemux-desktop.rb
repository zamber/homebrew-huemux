class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "545d33954dd030b448034f7c978229f822443bc4000e31e7387bb83166e4cc80"
  version "0.0.5-alpha.8"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "e132b9cc0984d0aedd120631bb62959dcf64cec6b948e87f5f80ab68f40d6b94"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "782e36e5e8a7b6f68a6314d4410b481a3e65412022288a51aa687cc4f0d67fd4"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "e9e62d0d0b1767b0ff5fd4df8ab8264289667257c0fe78ed250a83a5112ddc5a"
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
