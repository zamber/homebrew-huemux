class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-darwin-arm64",
      using: :nounzip
  sha256 "33a566aa86ad342577fe319b06e50af4332db06025ba060176b3df2a4c7592c3"
  version "0.0.5-alpha.6"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-darwin-amd64",
          using: :nounzip
      sha256 "1b056dcaa65f071736aea1acf40195d21dcf8eb0c8543b34707db2be3930cab1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-linux-amd64",
          using: :nounzip
      sha256 "a9fc56dd07ca6695b35e9a0197131b9a8959c89be7e648b2a40db6b025547642"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.6/huemux-linux-arm64",
          using: :nounzip
      sha256 "196b6f9e5a10bde5961115be6c7460c27d4459f797186e7b8bb248801c0c191d"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
