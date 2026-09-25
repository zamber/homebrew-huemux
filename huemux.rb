class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-darwin-arm64",
      using: :nounzip
  sha256 "d3e068102c3c437c8b0dd09fe5ad9fc28fe77b2f58342b24054077fa6a692397"
  version "0.0.5-alpha.2"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-darwin-amd64",
          using: :nounzip
      sha256 "394d6d2ccd69ad14064d4abb34d16cd0fd7fff87f87cd918fa7eced699cb286c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-linux-amd64",
          using: :nounzip
      sha256 "b7f5f24f3d8a01908d607eb2a449c2258963ff252045c0d6db1d4a5264a4548d"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.2/huemux-linux-arm64",
          using: :nounzip
      sha256 "378e79215fe811e3cb5e0abe3df646faf1987f9008fe668c47b02f47ba1a3c80"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
