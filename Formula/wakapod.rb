class Wakapod < Formula
  desc "Terminal client for Wakapod"
  homepage "https://github.com/jeremieb/wakapod-terminal"
  version "0.1.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.14/wakapod-0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "34a35b4123984d2998aee5901357cc75ac62586a5e344a068dcc658a2577f358"
    else
      url "https://github.com/jeremieb/homebrew-wakapod/releases/download/v0.1.14/wakapod-0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "9f6e530a0fe106e2c046b04aa2d82bcb48ca985115833044e00c55b5b71d6914"
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
