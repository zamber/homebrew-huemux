class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "bd1744604bf0b6425408735b276feaf0adbf7c4bbd0410e545977d546d966eed"
  version "0.0.4"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "b9d3a8744316804ee985833b8ab8a7cf33ebce39c00b7d6e680dbb9e52d74738"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "ec5ce3e71feba910ae0eda54093186d7d8ccef5b13aed4206ec4362a6341263d"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "72a37f76be71f857b33309ce9e784c6ba5d668e37396ed299b4bcc379f67f5e8"
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
