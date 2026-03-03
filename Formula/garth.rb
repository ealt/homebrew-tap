class Garth < Formula                                                                                                │
  desc "Workspace orchestrator for autonomous AI coding agents"                                                      │
  homepage "https://github.com/ealt/garth"                                                                           │
  url "https://github.com/ealt/garth/releases/download/v0.1.0/garth-0.1.0.tar.gz"                                    │
  sha256 "e03386764569f915c83b4a84ebb4590107379c211df893761395cff8c8eab418"                                                                                               │
  license "MIT"                                                                                                      │
                                                                                                                     │
  depends_on "python@3.12"                                                                                           │
                                                                                                                     │
  def install                                                                                                        │
    prefix.install Dir["*"]                                                                                          │
    bin.install_symlink prefix/"bin/garth"                                                                           │
  end                                                                                                                │
                                                                                                                     │
  def caveats                                                                                                        │
    <<~EOS                                                                                                           │
      To complete setup, run:                                                                                        │
        garth setup                                                                                                  │
                                                                                                                     │
      Prerequisites not managed by Homebrew:                                                                         │
        - 1Password CLI: brew install 1password-cli                                                                  │
        - Zellij: brew install zellij                                                                                │
        - Docker Desktop                                                                                             │
    EOS                                                                                                              │
  end                                                                                                                │
                                                                                                                     │
  test do                                                                                                            │
    assert_match version.to_s, shell_output("#{bin}/garth --version")                                                │
  end                                                                                                                │
end
