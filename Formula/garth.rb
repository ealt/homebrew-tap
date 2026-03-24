class Garth < Formula
  desc "Workspace orchestrator for autonomous AI coding agents"
  homepage "https://github.com/ealt/garth"
  url "https://github.com/ealt/garth/releases/download/v1.0.0/garth-1.0.0.tar.gz"
  sha256 "d7d7b1434757b0c1b8957c2a4299e9a6443daabfeb2a01e433e49807befd05d9"
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

      If `garth` is not found in the same terminal right after installation:
        - open a new shell, or run `rehash` (zsh) / `hash -r` (bash)
        - if a fresh shell still cannot find it, add Homebrew to your login PATH:
          eval "$("#{HOMEBREW_PREFIX}/bin/brew" shellenv)"
        - you can always run garth directly via:
          #{HOMEBREW_PREFIX}/bin/garth setup

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
