class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.0/wakapod-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fe543d9d0ad5f226c1382215e2e37a02260d5547a8bc982e45836f504fee9f97"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.0/wakapod-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "bffacab621037cd2e37a4b0d7a8fca5d4b07452c7295dfddf1f2ad318b9b9e8f"
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
