class ATest < Formula
  desc "Test CLI that prints install succeed"
  homepage "https://github.com/adzimzf/homebrew-tpot"
  url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.1.0/a-test-0.1.0.tar.gz"
  sha256 "53030894001883f6a401ac9e89754a6b1aed72f0117fce45783e6bb112c0f1fe"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_equal "install succeed", shell_output("#{bin}/a-test").strip
  end
end
