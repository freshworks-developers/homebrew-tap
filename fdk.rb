require "language/node"

class Fdk < Formula
  desc "Freshworks Developer Kit"
  license "MIT"
  homepage "https://developer.freshworks.com/"
  url "https://nodejs.org/dist/v18.18.2/node-v18.18.2-darwin-x64.tar.gz"
  sha256 "5bb8da908ed590e256a69bf2862238c8a67bc4600119f2f7721ca18a7c810c0f"

  
  # Define the resource
  resource "node" do
    if OS.mac?
      url "https://nodejs.org/dist/v18.18.2/node-v18.18.2-darwin-x64.tar.gz"
      sha256 "5bb8da908ed590e256a69bf2862238c8a67bc4600119f2f7721ca18a7c810c0f"
    elsif OS.linux?
      url "https://nodejs.org/dist/v18.18.2/node-v18.18.2-linux-x64.tar.xz"
      sha256 "9429e26d9a35cb079897f0a22622fe89ff597976259a8fcb38b7d08b154789dc"
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
