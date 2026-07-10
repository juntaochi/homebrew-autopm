require "language/node"

class Autopm < Formula
  desc "Standalone AutoPM agent with native product-management commands and skills"
  homepage "https://github.com/juntaochi/autopm"
  url "https://registry.npmjs.org/@jacfrost/autopm/-/autopm-0.0.3.tgz"
  sha256 "6442a65f30c79cc676dd39a5dfdbdb9182947d15b6832d71390bf016eb6b44be"
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
