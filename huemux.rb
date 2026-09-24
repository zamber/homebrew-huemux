class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-darwin-arm64",
      using: :nounzip
  sha256 "635d3ed373d58692f59dd6be3a18948d1be4c02a70d121aae5a42a223a09a430"
  version "0.0.5-alpha.1"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-darwin-amd64",
          using: :nounzip
      sha256 "a5896b2bfd6f5ce65e2c267cd2b695e63389681c411a183a797c6bb0f4f54630"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-linux-amd64",
          using: :nounzip
      sha256 "bd80833723f51f3513305e49882afef01dd690f8bb4c0080613acec0dc2b2c7a"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.5-alpha.1/huemux-linux-arm64",
          using: :nounzip
      sha256 "0ada7afc3e6e58f75ac1e46a697e2994fcde96482f35cae5659b5914bf0acd18"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
