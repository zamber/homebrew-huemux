class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-darwin-arm64",
      using: :nounzip
  sha256 "8fa805a6dc9cd51600116ec573def9c56e396cefa79fc58cec187430d7d591d5"
  version "0.0.2-alpha.25"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-darwin-amd64",
          using: :nounzip
      sha256 "84d7dbea6903bace221c6a6814761abe8b1ba1d38fd2fe13b4d5da320640041d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-linux-amd64",
          using: :nounzip
      sha256 "8c733af4148da3df4b7c31823e0a95f72c8e59c22d57c621dd820c0962887815"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.2-alpha.25/huemux-linux-arm64",
          using: :nounzip
      sha256 "de2bcde0c73dcfc3b668ad14103233165d42583cd368650e3f6c54600989d262"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
