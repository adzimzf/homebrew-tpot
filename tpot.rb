# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "custom_download_strategy"
class Tpot < Formula
  desc "tpot is a simple tool to access teleport web UI from terminal"
  homepage "https://github.com/adzimzf/tpot"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "http://github.com/adzimzf/tpot/releases/v0.0.3/tpot_0.0.3_macOS_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "624736bf11f41ffa333ebb01c5f342de3427137b59a3c8a928b241abc816cebe"

      def install
        bin.install "program"
      end
    end
    if Hardware::CPU.intel?
      url "http://github.com/adzimzf/tpot/releases/v0.0.3/tpot_0.0.3_macOS_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "d49e4189a62734b41528a016a2c10747327c2c34e6ff777eb3d007b2c7dee26e"

      def install
        bin.install "program"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "http://github.com/adzimzf/tpot/releases/v0.0.3/tpot_0.0.3_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "3ec6de74afe95d90e44b68b5311abf21ff003498169def745b20101c757e13cc"

      def install
        bin.install "program"
      end
    end
    if Hardware::CPU.intel?
      url "http://github.com/adzimzf/tpot/releases/v0.0.3/tpot_0.0.3_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "4eac320fe4fdb1fd23e762f0f178093ca4e4da98e632d491b2fd419606d5e965"

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
