class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "f5282f3653b830b78309e30db6ea361e87a9265446436268db18df3c7c1c5e4e"
  version "0.0.4-alpha.7"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "63be64db3e442ee6ddbba53be81a5c7fa99a31438aaf4ec561d2301bb2cb040b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "bb1a20a2b8969e11abb19c7869b1650cbe03e0147647d8d401893f25ef70ae51"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.7/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "ce37045b98710cdf536ff271260daba92ac0116e6168f77e180097929cb869e9"
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
