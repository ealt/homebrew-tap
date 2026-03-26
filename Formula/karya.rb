class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v2.0.0/karya-2.0.0.tgz"
  sha256 "36a40e5f8519b514232da09964dcd96f15adf1c6575e2a0782c3b5714ee5682a"
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
