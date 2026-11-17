class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.7/wakapod-0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "f5545073cb61e80403c460329abcd3d67c606aabf0454d1ec6f6d4ab4b3cb838"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.7/wakapod-0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "0de77d02c9ae565174e713c9f26ce2c520b87d07f5f3ccefd28b7c1de17775a1"
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
