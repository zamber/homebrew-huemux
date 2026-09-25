class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-darwin-arm64",
      using: :nounzip
  sha256 "3cc24642088770b8293aed35ae89f1016031f6d357041c46a1e11ccc3159d850"
  version "0.0.5-alpha.5"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-darwin-amd64",
          using: :nounzip
      sha256 "199ba09c25564d371a5f4bc777998192848c4c25fd6470d4db4f5f1b84d49f0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-linux-amd64",
          using: :nounzip
      sha256 "6c285f79ebcba41d0716691f3b75a73993e20c72b8c469026464afd64ceae719"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.5/huemux-linux-arm64",
          using: :nounzip
      sha256 "391a3916a5a05c25ae021e05f147680eb0244a96a1bfdb66b71a7ff11a92647a"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
