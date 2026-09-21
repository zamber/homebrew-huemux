class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-darwin-arm64",
      using: :nounzip
  sha256 "a4751404160d220e3fe6adbf9b0df7fec16c492e5865267144b0379f1c32a6c0"
  version "0.0.4"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-darwin-amd64",
          using: :nounzip
      sha256 "ebdb434cb3f818a8bfcd8737a9d2107994054c25ec16b32d6f7b70604f3616fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-linux-amd64",
          using: :nounzip
      sha256 "2e8474596bed1dcff54334094519d1ce303a9fdef3c616081843f7c9e8ab7445"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4/huemux-linux-arm64",
          using: :nounzip
      sha256 "42ad8595daa0763dbc95cb77559ad6a2ecaee7f2a902fe79126a55e743f21322"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
