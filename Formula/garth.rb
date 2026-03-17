class Garth < Formula
  desc "Workspace orchestrator for autonomous AI coding agents"
  homepage "https://github.com/ealt/garth"
  url "https://github.com/ealt/garth/releases/download/v0.3.2/garth-0.3.2.tar.gz"
  sha256 "745a5399424d2efda85b2637c373b6f273fc0127ac9f806f34354e26be492bba"
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
