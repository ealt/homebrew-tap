class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v2.0.1/karya-2.0.1.tgz"
  sha256 "977ec7a86b8303d7bf800e07dc482fe0af99b0ec287eca8e4006a735b3325b73"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args
    bin.install_symlink libexec/"bin/karya"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/karya --version")
  end
end
