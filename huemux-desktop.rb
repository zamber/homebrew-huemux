class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "cc776121e30aa2efc2be6a74e8c1a8da0b44df884c8e1b7e3a8254e7c5c58f72"
  version "0.0.5-alpha.1"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "032960e0d22b9401390669ae6b9cfea36a8152aaa91b58d8e311ce62c84015bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "7993fa2407212500a6bf02a4a55be45ba509aca49a22bdfaa1715f1834cc6747"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "85f2538ab6d37ee1710df2544b539188dfc50bf7c9052da9f993f3c0d6e64f46"
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
