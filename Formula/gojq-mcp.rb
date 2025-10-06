class GojqMcp < Formula
  desc "MCP server that runs jq filters against JSON"
  homepage "https://github.com/berrydev-ai/gojq-mcp"
  license "MIT"

  # Set this to your latest tag (without the leading 'v' in version, but keep 'v' in the URLs)
  version "1.0.1"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/berrydev-ai/gojq-mcp/releases/download/v#{version}/gojq-mcp-darwin-arm64"
      sha256 "118189cb40a455822e0b948b51b06e18332479ab82177f7db74163f3d4caa523"
      def install
        bin.install "gojq-mcp-darwin-arm64" => "gojq-mcp"
      end
    end
    on_intel do
      url "https://github.com/berrydev-ai/gojq-mcp/releases/download/v#{version}/gojq-mcp-darwin-amd64"
      sha256 "044431483ec2bf4aade7a55328d6f82fffab493a053c583b478a1331d56c95db"
      def install
        bin.install "gojq-mcp-darwin-amd64" => "gojq-mcp"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/berrydev-ai/gojq-mcp/releases/download/v#{version}/gojq-mcp-linux-arm64"
      sha256 "2958c21a5731d23a12a7a9fdef6860e24240a06f749ba029df6bbaad6f8321bf"
      def install
        bin.install "gojq-mcp-linux-arm64" => "gojq-mcp"
      end
    end
    on_intel do
      url "https://github.com/berrydev-ai/gojq-mcp/releases/download/v#{version}/gojq-mcp-linux-amd64"
      sha256 "c7bca09c2f5ec43bc909a8815427a0e51e7d7416ee875653130d62a70916cc80"
      def install
        bin.install "gojq-mcp-linux-amd64" => "gojq-mcp"
      end
    end
  end

  def caveats
    <<~EOS
      Installed as 'gojq-mcp'. See README for usage:
      https://github.com/berrydev-ai/gojq-mcp#readme
    EOS
  end

  test do
    # Prefer a stable, fast check; '--version' is ideal if implemented.
    output = shell_output("#{bin}/gojq-mcp --help 2>&1")
    assert_match("jq", output)
  end
end
