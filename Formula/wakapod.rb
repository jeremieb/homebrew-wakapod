class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.8/wakapod-0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "70879223ec2a8dd0c47d96403a1c9a28990bf52184b63beba54189262e43165e"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.8/wakapod-0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "ff93ae11e2abd91280a1cf06c5d50eb171b225561b7fcac90f277ee87658e653"
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
