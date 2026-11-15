class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.1/wakapod-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "9bee9e519162b2db798430c7c48ab2d30aa0935464d8b84873bcba3b13a0cd1b"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.1/wakapod-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "2df0374d39604c5cf09754d1e11e6e6343645ca8840273611bd89c3519feb8f1"
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
