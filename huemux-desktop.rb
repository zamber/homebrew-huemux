class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "84e9f4ce380b05150d0ae5cea98d271b0059f54056eb882a8374131854ce14a2"
  version "0.0.5-alpha.2"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "98542798900be3642aac03b9b194edcc33d4f46e10d99c2754074cf3f7a284d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "4b652115c277695c15fe3e4a7c8a099774e6badad0a0535091f1d59d2015b4f0"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "ee9d38247d540b866370e6ba185dce950baa07adea6cc1e09d87500506879348"
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
