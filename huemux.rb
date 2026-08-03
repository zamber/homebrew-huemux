class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-darwin-arm64",
      using: :nounzip
  sha256 "8426836b8bbc53b5ef34ae2cf8b5f87cbf6e009c9b8fff3bf8daf67d62ba3445"
  version "0.0.2-alpha.32"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-darwin-amd64",
          using: :nounzip
      sha256 "565c8f8fd2998a77844e5e125dea6e97afc7c5d6c346109baee875cdf7f667d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-linux-amd64",
          using: :nounzip
      sha256 "5755cf930d30bbbe099335a51d203c6934433d19bdea1cd1bc5c7cc610712147"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.32/huemux-linux-arm64",
          using: :nounzip
      sha256 "5067de251fbfd8eceadae8511f8d01768ffe6f8dc0b93895754703040be0f459"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
