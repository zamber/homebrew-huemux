class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-darwin-arm64",
      using: :nounzip
  sha256 "1f98b3060f95bf4850dd268de15a4c99346aa2a84ddde0a9a10ec87dfa14a235"
  version "0.0.2-alpha.37"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-darwin-amd64",
          using: :nounzip
      sha256 "0291b052c20f80108ccd8dce2f040d28610c75b28a1f7b08390c632e0dc8b6dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-linux-amd64",
          using: :nounzip
      sha256 "45646cfaac60aa2c07b17f1837a5e60c13b9115246233ed3dd9a597e7efd86d4"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.37/huemux-linux-arm64",
          using: :nounzip
      sha256 "b0996216ed9e55787276021dab8d6d52357b348fea2edcb9d17e9d75a358324b"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
