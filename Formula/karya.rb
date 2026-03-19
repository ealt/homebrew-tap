class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v0.2.0/karya-0.2.0.tgz"
  sha256 "a6d69ffc5ec72c211104e9461f2a4fe998dfca55aa71fe3dd3f1bfa556f9c11d"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args(libexec)
    bin.install_symlink libexec/"bin/karya"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/karya --version")
  end
end
