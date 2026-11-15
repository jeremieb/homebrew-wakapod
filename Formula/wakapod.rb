class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.4/wakapod-0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "9f8fa96311d365b6e77f3923deaf90df6a352d78b697ff9bdf1720208835fd59"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.4/wakapod-0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "fc4ba7c2ee0a1c0833e781d13162358ab9b28b24d99c8da74f496b59dfd8c827"
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
