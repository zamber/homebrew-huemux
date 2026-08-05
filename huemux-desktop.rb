class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "7eb5ff1a11683c4a4a173c906e6ff88bee39af2d58ca8f9045f16df47bc6e835"
  version "0.0.2-alpha.37"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "9ddf03bf10def96737a3ed93720ebaf939d3df42a643f27c9c166b17a18314b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "2636afa0536f3875ed8d788bc6c1906ed903270f1bef9a2d9d832317f9c273f5"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "971b3e19e5b89b4e84c3893a15256d9437d4f112c8f81d53490bf00be948fb3a"
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
