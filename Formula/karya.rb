class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v1.0.0/karya-1.0.0.tgz"
  sha256 "a273b6c6d404d80b6507ef8a81bfd46cc7df22ab5ee99bd81012f35906ff0e24"
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
