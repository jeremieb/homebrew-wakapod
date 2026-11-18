class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.9/wakapod-0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "3c8a1cd8fab414e1654a19b683795cedad56724157a92fc52481dae9c7817541"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.9/wakapod-0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "be624f366549885f7c630d7b31d5d9a98161d256936e82f9c8f741d0ed82d35f"
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
