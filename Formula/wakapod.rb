class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.13/wakapod-0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "98af5d04cda709eb5827c8bebe2ca141f0c434f259a0173b4935f7e170880165"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.13/wakapod-0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "b9f2401d92835657131d622cb353279e220a417401234536d8dbf655f0add84c"
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
