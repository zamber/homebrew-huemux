class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-darwin-arm64",
      using: :nounzip
  sha256 "024ef3f1cd368ce1c5962675e25ec86bfed633e8b8d3e2716e634d2f7ac6bb43"
  version "0.0.4-alpha.4"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-darwin-amd64",
          using: :nounzip
      sha256 "5dc5e26f96cdd670042bcde50a4dfd30115de8ab24000c603809ddc4cced1dd2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-linux-amd64",
          using: :nounzip
      sha256 "63981525a95e716818543032dad8aa691a7306e409fc11c4c253b1386ce765e9"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.4/huemux-linux-arm64",
          using: :nounzip
      sha256 "c3d3443961a7fa2978345f5651ba30159e75425975f05f5126c157ed6bb1c22f"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
