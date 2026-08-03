class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "f922a9f09818aa3de0810f3de03308a143e73295979476bc5402c4480bcccb18"
  version "0.0.2-alpha.32"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "04d6add5eb90b52bc7931c7dd8890eff73199a31c6987b40d0b92cc4a5afade6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "a91aa3824d241a3dac040bec58bdc51f65d742c075ba667807a5b14050080e7b"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "1c2c8b2aa8c45e49e788146219d0fd7fa8183686bd1cf142f906bad29f0577f3"
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
