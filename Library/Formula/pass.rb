class Pass < Formula
  homepage "http://www.passwordstore.org/"
  url "http://git.zx2c4.com/password-store/snapshot/password-store-1.6.5.tar.xz"
  sha256 "337a39767e6a8e69b2bcc549f27ff3915efacea57e5334c6068fcb72331d7315"

  bottle do
    cellar :any
    sha1 "92167f8c3c210c7d3dba4f6bcae25f2002e61264" => :yosemite
    sha1 "f2211e6610a9f548b58be03b80554078633da4b9" => :mavericks
    sha1 "f1ff07f0b9b03ff90c2175dd8858c89abae8b89c" => :mountain_lion
  end

  head "http://git.zx2c4.com/password-store", :using => :git

  depends_on "pwgen"
  depends_on "tree"
  depends_on "gnu-getopt"
  depends_on :gpg

  def install
    system "make", "PREFIX=#{prefix}", "install"
    share.install "contrib"
    zsh_completion.install "src/completion/pass.zsh-completion" => "_pass"
    bash_completion.install "src/completion/pass.bash-completion" => "password-store"
  end

  test do
    system "#{bin}/pass", "--version"
  end
end
