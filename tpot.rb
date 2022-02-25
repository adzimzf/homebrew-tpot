# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Tpot < Formula
  desc "tpot is a simple tool to access teleport web UI from terminal"
  homepage "https://github.com/adzimzf/tpot"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "http://github.com/adzimzf/tpot/releases/tag/v0.0.3/tpot_0.0.3_macOS_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "eec2790d75aad25302898c8bc00e7f464505de3341588dca09e3a1f723b00af1"

      def install
        bin.install "program"
      end
    end
    if Hardware::CPU.intel?
      url "http://github.com/adzimzf/tpot/releases/tag/v0.0.3/tpot_0.0.3_macOS_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "940add3d59456ab7793d051853fbac8ea4a716c32fc0e8cfd8e0c9f174910142"

      def install
        bin.install "program"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "http://github.com/adzimzf/tpot/releases/tag/v0.0.3/tpot_0.0.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "d594e5bcdf91db4d3f5f4d6a289d0fccf59a754540067cfef9c466047779449b"

      def install
        bin.install "program"
      end
    end
    if Hardware::CPU.intel?
      url "http://github.com/adzimzf/tpot/releases/tag/v0.0.3/tpot_0.0.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "24134b3bc2cc11e889e704988ce7a4cc4fe9aae947ae41119f8b022b849d149d"

      def install
        bin.install "program"
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
