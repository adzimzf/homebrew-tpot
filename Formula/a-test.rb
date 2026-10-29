class ATest < Formula
  desc "Test CLI that prints install succeed"
  homepage "https://github.com/adzimzf/homebrew-tpot"
  url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.1.0/a-test-0.1.0.tar.gz"
  sha256 "602372956df788ecd9463bde27ff72b650260b7f6fe9eb5ac35820621afed222"
  license "MIT"

  bottle do
    root_url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "88ddc6686585cf0483a17daecb40573eadfcbdf3bdc4fa933981de8986b65751"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "5d0292b744a1febd813ee58a0ddaa8dd13dda2ee490f9480dd81268027d7310d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a75ad1cebec51900bc62c091f1b22fecb009088a9e40cb408d7e246c91bc9330"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"a-test", "."
  end

  test do
    assert_equal "install succeed", shell_output("#{bin}/a-test").strip
  end
end
