class Garth < Formula
  desc "Workspace orchestrator for autonomous AI coding agents"
  homepage "https://github.com/ealt/garth"
  url "https://github.com/ealt/garth/releases/download/v1.2.0/garth-1.2.0.tar.gz"
  sha256 "4af2c7b7c46137713f3ed0bf24b1004c909177b5f8238e815b25b328e5859b05"
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
