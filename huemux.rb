class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-darwin-arm64",
      using: :nounzip
  sha256 "439f0eed70cca2e4779e4eb4cb63b7df94da4adb2646418c56add8b6755e0088"
  version "0.0.5-alpha.8"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-darwin-amd64",
          using: :nounzip
      sha256 "149c32d95166aee6ef0cc9dfd524f97d5f0e41338bd2cf71a2a5586c32cc2800"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-linux-amd64",
          using: :nounzip
      sha256 "faff34218a49f0cf5e95f87ad85b83fe9249f8621ad4c3909cb2b3ae6efd6c3b"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.8/huemux-linux-arm64",
          using: :nounzip
      sha256 "8e27b1cca4bb6ff920392209f4731e48d4e0d52fe9dab4593ee5b776cc2a1eab"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
