class Karya < Formula
  desc "SQL-backed task tracker for orchestrating AI agents"
  homepage "https://github.com/ealt/karya"
  url "https://github.com/ealt/karya/releases/download/v0.1.1/karya-0.1.1.tgz"
  sha256 "3ebffa79041bc416b13b225011fb4b2015205bcace37743850c763e54162a70b"
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
