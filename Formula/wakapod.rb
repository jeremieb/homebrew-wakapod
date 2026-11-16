class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.5/wakapod-0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "d70cf467436b0c3b078ea286671b7ea9fb91d71888e7b543b01e83926de60ae6"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.5/wakapod-0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "350757cc779e4a257498b2805dc28ba778f1f1c8672501cc1a557bfed1d7d13b"
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
