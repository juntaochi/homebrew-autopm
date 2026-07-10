require "language/node"

class Autopm < Formula
  desc "Standalone AutoPM agent with native product-management commands and skills"
  homepage "https://github.com/juntaochi/autopm"
  url "https://registry.npmjs.org/@jacfrost/autopm/-/autopm-0.0.3.tgz"
  sha256 "70fd4baeb807f69625392a029444ad2170935918eb912b6f62f9f5588d28d5d3"
  license :cannot_represent # package.json declares UNLICENSED

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "autopm", shell_output("#{bin}/autopm --help")
  end
end
