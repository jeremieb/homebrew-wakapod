class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.17/wakapod-0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "7732258be18a90d6f53b0d6ba3ac8050556cf563b609d1b81a663b4fce15a3ce"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.17/wakapod-0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "73753f531c2db9632d3cead0bafe1280b9a38d8662f563c4f0c9a6f4cc219a31"
    end
  end

  def install
    bin.install "wakapod"
    doc.install "NOTICE"
  end

  def caveats
    <<~EOS
      For Opus playback, install the optional fallback player:
        brew install mpv
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wakapod --version")
  end
end
