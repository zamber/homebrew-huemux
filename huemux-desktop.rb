class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "b51b8dcefed06bd708f8a8e0078f5c71e3e203df430c87402de0b5d43f9a0eaf"
  version "0.0.2-alpha.25"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "a00f248987e89247eb99aaecbb9fbd54980209094f3942137e506474bff57a3f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "19cd2a22284e3e19b868ec10e39b1ac6e5a87efd51005812064b6b8588a960e3"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "3a4792e8d86ab8e21db76858b3461e79a02b368648ee7e3a714a866d049e5dff"
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
