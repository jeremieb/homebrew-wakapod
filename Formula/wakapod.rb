class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.10/wakapod-0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "ff57302ffeed1c47e008ea8b43efebda0c1b5387bbf8b67fd46aa2df1b345540"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.10/wakapod-0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "94ddf6e3b1783683805e6160133846eef2e960346e17955d43a5684eb470d357"
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
