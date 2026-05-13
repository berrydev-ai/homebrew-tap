class SlackPost < Formula
  desc "Post messages to Slack from agent workflows"
  homepage "https://github.com/berrydev-ai/agent-cli-tools"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/berrydev-ai/agent-cli-tools/releases/download/slack-post-v#{version}/slack-post_v#{version}_darwin_arm64.tar.gz"
      sha256 "e25d5bcf4943631b06078604ac29d5ea87a644f03244cf04cf528aee8de9ae78"
    end

    on_intel do
      url "https://github.com/berrydev-ai/agent-cli-tools/releases/download/slack-post-v#{version}/slack-post_v#{version}_darwin_amd64.tar.gz"
      sha256 "44c3934c7bd4d110bdf38cc884d6c725d9dbc98b94b9ad84ffc8184ffe817e68"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/berrydev-ai/agent-cli-tools/releases/download/slack-post-v#{version}/slack-post_v#{version}_linux_arm64.tar.gz"
      sha256 "932ca03a30d572a3eea10ff3e6325f7503d119028a571c23a6b9c42fee9b9c46"
    end

    on_intel do
      url "https://github.com/berrydev-ai/agent-cli-tools/releases/download/slack-post-v#{version}/slack-post_v#{version}_linux_amd64.tar.gz"
      sha256 "0b2d2e0eaf9acd87b0163dcdba8109bbbad3b860d2b02c4089f4ea128debb7a7"
    end
  end

  def install
    bin.install "slack-post"
  end

  def caveats
    <<~EOS
      slack-post requires a Slack bot token and target channel, supplied with
      flags or SLACK_E2E_BOT_TOKEN and SLACK_E2E_TARGET_CHANNEL.
    EOS
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/slack-post --version")
  end
end
