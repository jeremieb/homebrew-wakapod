class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.15/wakapod-0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "06d04a872222e208aa0d637eea6001e4016d2b784874baa95e6fda50f585df59"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.15/wakapod-0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "5463332cbafb437fe83746551304b9af89e15b4b1e829a0fa245dba12cd1a114"
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
