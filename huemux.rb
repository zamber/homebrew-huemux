class Huemux < Formula
  desc "Screen-synced lights for Philips Hue — plain server"
  homepage "https://github.com/zamber/huemux"
  url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-darwin-arm64",
      using: :nounzip
  sha256 "2e32b62e2ff9db513e917698af0ceb3dd10846f864c8968f7049ee9110dff3b0"
  version "0.0.4-alpha.9"
  license "GPL-3.0-or-later"

  # The release ships one raw binary per OS/arch. Assets are replaced by
  # scripts/bump.sh on every new release; the `using: :nounzip` keeps brew
  # from treating the binary as an archive.

  on_macos do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-darwin-amd64",
          using: :nounzip
      sha256 "97d0eb5dee3f8596484270b05f7b713b3b325dc71f5af41a158b976e836adc85"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-linux-amd64",
          using: :nounzip
      sha256 "73f50f43d3e2cb547442a2921725935f222b01b3d39ac0ba069f6e78d59dadc6"
    end
    on_arm do
      url "https://github.com/zamber/huemux/releases/download/v0.0.4-alpha.9/huemux-linux-arm64",
          using: :nounzip
      sha256 "ef22872b0c07479b1b16cb955a98781588d33eca3184cbf1ef76424e18ef4fcb"
    end
  end

  def install
    bin.install Dir["huemux-*"].first => "huemux"
  end

  test do
    assert_match "huemux", shell_output("#{bin}/huemux --help 2>&1")
  end
end
