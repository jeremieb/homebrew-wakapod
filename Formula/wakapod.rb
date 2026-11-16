class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.6/wakapod-0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "933a76edd6584063708dfe8d2a97795f9ad2b52b2fce26c7149675f85188cc80"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.6/wakapod-0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "c3fc9ea361933f73ae71f34274d39ffc42094f065317a5fc4f03df7ecdcf057a"
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
