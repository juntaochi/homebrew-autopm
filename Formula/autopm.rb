require "language/node"

class Autopm < Formula
  desc "Standalone AutoPM agent with native product-management commands and skills"
  homepage "https://github.com/juntaochi/autopm"
  url "https://registry.npmjs.org/@jacfrost/autopm/-/autopm-0.0.1.tgz"
  sha256 "b38839acddad060682484ffdd497f3443d88a956dfcc715bf98a30179ffbbd15"
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
