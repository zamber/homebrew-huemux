class HuemuxDesktop < Formula
  desc "Screen-synced lights for Philips Hue, in a desktop window"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-desktop-darwin-arm64",
      using: :nounzip
  sha256 "670451dcb2cc7d3ace5b1342f9726db0753148a743ac9caa109f5e5565b35204"
  version "0.0.2-alpha.38"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-desktop-darwin-amd64",
          using: :nounzip
      sha256 "7ebf5742fb3445ef99206f80810d6f55ffa28f7475560b227d473ec3618da207"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-desktop-linux-amd64",
          using: :nounzip
      sha256 "2cc9d70e4337f145c0d68342621234ee0f8293db2f36e770025ebec2aafa2fcc"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-desktop-linux-arm64",
          using: :nounzip
      sha256 "07c5cc450b35c5fbb9aee1dc43b8f913c117e40b6417a06c671a84fb6476b473"
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
