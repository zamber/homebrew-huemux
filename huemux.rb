class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-darwin-arm64",
      using: :nounzip
  sha256 "70c34bb392c5dc1c606bbaf872cfff66d32ec9969244e7a5662a4a0d3ed8bce7"
  version "0.0.2-alpha.38"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-darwin-amd64",
          using: :nounzip
      sha256 "ae517ef1b1fcb3c4aa9aa72e0ad892f49a4f144cac31b008c9ad026acd9109e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-linux-amd64",
          using: :nounzip
      sha256 "291a78d50e1e45926c965f19ae1ee46c9c23f9e01dbac36b7539c04a75574bb3"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.38/huemux-linux-arm64",
          using: :nounzip
      sha256 "092943a5a7ae7bb0570be8f4735acf116dc70385bd9c03bc56e93cb1c6f31f84"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
