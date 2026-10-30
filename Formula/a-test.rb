class ATest < Formula
  desc "Test CLI that prints install succeed"
  homepage "https://github.com/adzimzf/homebrew-tpot"
  url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0/a-test-0.2.0.tar.gz"
  # Explicit: zerobrew reads the version from a version line or from the URL,
  # and can't parse it from the a-test-v<version> tag.
  version "0.2.0"
  sha256 "8b1af2223d8d509d39dd6a2e3a2d64ad225d0a711bda61e48bbc43a353e175cd"
  license "MIT"

  bottle do
    root_url "https://github.com/adzimzf/homebrew-tpot/releases/download/a-test-v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "74b611aa1eb2ae2af7b80d3c2a9bb29e33921b3ebfdf137ea46ead123c21adef"
    sha256 cellar: :any_skip_relocation, arm64_linux:   "21afb403ebe9d922d06ffbc8bf74146ed7724666dbdeca23fb34ddf39ad4de92"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aed0a7930efd81e73a805aee1173b8875bb39839e21ef6553c3ea2ba5c8e7ce3"
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
