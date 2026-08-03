class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "5d68814fc082397b0d04ec34d47cb65aec0839e1a41e8401e42e2ecd3a5f2c9d"
  version "0.0.2-alpha.26"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "f495e6f0decda022e7038ec6fc5599686d22acba4ae985a8ce67efc903c2b6e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "f25034f3cf45ef6a23a8d624eb00ebec56a2154da334f4a5c64676d0ccc6444b"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.26/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "b58ac728893d955c41d7352032550b82561fc7038f1c609c80cd4162c811025a"
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
