class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.12/wakapod-0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "80c014c1d074db65a77c12779dfbba8d811eddf9d1fb2a54a0e5f1ae493b9871"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.12/wakapod-0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "f16a41d74dcbd4cf8e43b7f8c048e51e3c88e1b1853a02ad3bd3c8a3153063dd"
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
