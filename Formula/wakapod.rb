class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.16/wakapod-0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "19b961e46438a1abbcd180c4859341367799e8891be810c83b181f79d689fab5"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.16/wakapod-0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "4cc7a68da487925ec705ff55c280094945de16e581f3f57940ef1aa449bd893d"
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
