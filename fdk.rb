# typed: strict
# frozen_string_literal: true

require "language/node"

# Freshworks Developer Kit formula - bundles Node.js and FDK CLI
class Fdk < Formula
  desc "Freshworks Developer Kit"
  homepage "https://developer.freshworks.com/"
  url "https://nodejs.org/dist/v24.11.0/node-v24.11.0-darwin-x64.tar.gz"
  sha256 "3884671e87f46f773832d98a0a6cabcc5ec4f637084f0f3515b69e66ea27f2f1"
  license "MIT"

  resource "node" do
    if OS.mac?
      if Hardware::CPU.arm?
        url "https://nodejs.org/dist/v24.11.0/node-v24.11.0-darwin-arm64.tar.gz"
        sha256 "0be2ab2816a4fa02d1acff014a434f29f56d8d956f5af6a98b70ced6c5f4d201"
      else
        url "https://nodejs.org/dist/v24.11.0/node-v24.11.0-darwin-x64.tar.gz"
        sha256 "3884671e87f46f773832d98a0a6cabcc5ec4f637084f0f3515b69e66ea27f2f1"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        url "https://nodejs.org/dist/v24.11.0/node-v24.11.0-linux-arm64.tar.xz"
        sha256 "33a6673b2c7bffeae9deec7f9f8b31aad9119b08f13d49b2ca3ee3bebfe8260f"
      else
        url "https://nodejs.org/dist/v24.11.0/node-v24.11.0-linux-x64.tar.xz"
        sha256 "46da9a098973ab7ba4fca76945581ecb2eaf468de347173897044382f10e0a0a"
      end
    end
  end

  def install
    target_dir = prefix/"custom_node_location"

    resource("node").stage do
      target_dir.install Dir["*"]
      ohai "Node.js installed to #{target_dir}"
    end

    # Add the node and npm to the PATH
    ENV.prepend_path "PATH", "#{prefix}/custom_node_location/bin"

    # Verify the installation
    node_version_output = Utils.safe_popen_read("node", "--version").strip
    ohai "Node.js version: #{node_version_output}"

    npm_version_output = Utils.safe_popen_read("npm", "--version").strip
    ohai "npm.js version: #{npm_version_output}"

    # npm config set prefix /usr/local/Cellar/fdk/64/custom_node_location
    system "#{prefix}/custom_node_location/bin/npm", "config", "set", "prefix", "#{prefix}/custom_node_location"

    # install latest FDK
    system "#{prefix}/custom_node_location/bin/npm", "install", "-g", "https://cdn.freshdev.io/fdk/latest.tgz"
  end

  test do
    system true
  end
end
