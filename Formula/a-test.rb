class ATest < Formula
  desc "Test CLI that prints install succeed"
  homepage "https://github.com/adzimzf/homebrew-tpot"
  url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0/a-test-0.2.0.tar.gz"
  sha256 "8b1af2223d8d509d39dd6a2e3a2d64ad225d0a711bda61e48bbc43a353e175cd"
  license "MIT"

  bottle do
    root_url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1b587dba0179c7da0c46848c33a612620eb2722cf16207613bfe8b0b3a31bd18"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "21817a2871b3cfe42681dcd979baf15850e3ce21785ceefb13734078b8eb1d0f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3cf887849e65c47e957b88a6d5f29d2b2f0b7727c1a96f29a0b965c177ffa736"
  end

  option "with-color", "Print the message in color"

  depends_on "go" => :build

  def install
    tags = build.with?("color") ? ["-tags", "color"] : []
    cd "cmd/a-test" do
      system "go", "build", *tags, "-ldflags", "-X main.version=#{version}", "-o", bin/"a-test", "."
    end
  end

  test do
    message = build.with?("color") ? "\e[32minstall succeed\e[0m" : "install succeed"
    assert_equal message, shell_output("#{bin}/a-test").strip
    assert_equal version.to_s, shell_output("#{bin}/a-test --version").strip
  end
end
