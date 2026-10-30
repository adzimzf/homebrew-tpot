class ATest < Formula
  desc "Test CLI that prints install succeed"
  homepage "https://github.com/adzimzf/homebrew-tpot"
  url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0/a-test-0.2.0.tar.gz"
  sha256 "8b1af2223d8d509d39dd6a2e3a2d64ad225d0a711bda61e48bbc43a353e175cd"
  license "MIT"

  bottle do
    root_url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9124bce3b4ba7e562034414074d73b27d8823c97d368c97290fa5014dd2724de"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "8d5a2781cf8730e23c9a49db138abadda7b5f4aa41c4c7a819c63ab84ca72493"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b6f128a3b704ccac0ca49aa238f4acc6b02188f0e9b3bc11e51f0da0edfcd49d"
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
