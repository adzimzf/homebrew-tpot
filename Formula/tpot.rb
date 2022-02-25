# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tpot < Formula
  desc "tpot is a simple tool to access teleport web UI from terminal"
  homepage "https://github.com/adzimzf/tpot"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adzimzf/tpot/releases/download/v0.0.3/tpot_0.0.3_macOS_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "116fe7835dc4970ab72111c635fd80eeca6d38410b59dafd525af5d873be9d5b"

      def install
        bin.install "/usr/bin"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/adzimzf/tpot/releases/download/v0.0.3/tpot_0.0.3_macOS_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "6d732abf32daa9184844b924e0a0c2ce4ef1dba3cd64f0e876b67754c8304b49"

      def install
        bin.install "/usr/bin/tpot"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/adzimzf/tpot/releases/download/v0.0.3/tpot_0.0.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "df1d0ccb6bafead9e9215c0a2d60c83b1f5276dba45489c4b93236432a97330e"

      def install
        bin.install "/usr/bin/tpot"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/adzimzf/tpot/releases/download/v0.0.3/tpot_0.0.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "84a6abfbf21ca7c9670e3df990a490e146aa0f10bdba3dd2d09c70882bd4ae4e"

      def install
        bin.install "/usr/bin/tpot"
      end
    end
  end

  head "https://github.com/adzimzf/tpot.git"

  depends_on "git"
  depends_on "zsh" => :optional

  test do
    system "#{bin}/tpot --version"
  end
end
