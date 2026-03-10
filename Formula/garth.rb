class Garth < Formula
  desc "Workspace orchestrator for autonomous AI coding agents"
  homepage "https://github.com/ealt/garth"
  url "https://github.com/ealt/garth/releases/download/v0.3.0/garth-0.3.0.tar.gz"
  sha256 "29962d0675edd87f14bf950f352ae0c702494c20325543140649c66a86c1f246"
  license "MIT"

  depends_on "python@3.12"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"bin/garth"
  end

  def caveats
    <<~EOS
      To complete setup, run:
        garth setup

      Prerequisites not managed by Homebrew:
        - 1Password CLI: brew install 1password-cli
        - Zellij: brew install zellij
        - Docker Desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/garth --version")
  end
end
