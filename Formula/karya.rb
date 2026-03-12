class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v0.1.0/karya-0.1.0.tgz"
  sha256 "REPLACE_ME"
  license "MIT"

  depends_on "node"

  def install
    cd "package" do
      system "npm", "install", "--omit=dev", *std_npm_args(libexec)
    end

    bin.install_symlink libexec/"bin/karya"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/karya --version")
  end
end
