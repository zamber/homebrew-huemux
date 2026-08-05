class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "4c77ec4fbad8ae2987f1b09971972a7e51f3b01bb11b4d6e9e86c06492bd9819"
  version "0.0.4-alpha.4"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "ccb6172bebfb970f6f446e71071fe6408cfdf18c533803f72640f130c32b79f5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "f6e525d03741137d1c5952422a5cffdf8e402005f90add8fa9b05c896bfb6ff5"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "6935e9ba72a87e361478fd0e0dd4696ccdbf0d41d9e6da45cec4a67e2d10a308"
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
