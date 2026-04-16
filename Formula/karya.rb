class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v2.0.3/karya-2.0.3.tgz"
  sha256 "34842305e18979694b12d9a5b68c882b4da222f47b1a96fbd111c799d5d912b3"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", "--omit=dev", *std_npm_args

    # Install optional pg dependency for PostgreSQL support
    cd libexec/"lib/node_modules/karya" do
      system "npm", "install", "pg"
    end

    bin.install_symlink libexec/"bin/karya"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/karya --version")
  end
end
