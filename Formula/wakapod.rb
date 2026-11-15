class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.2/wakapod-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "4f39bb0e4d4d354e278e2aa151253517a9f1e6b44d0a1f554ea4e1d73a91bbcd"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.2/wakapod-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "c683dfca0e9106f485f73097cf53bcb7e981b566560d4c5578c971de1fc95b3b"
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
