class Threepitor < Formula
  desc "Markdown blog-post editor with Claude built in"
  homepage "https://github.com/mxriverlynn/3Pitor"

  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.3.0/3pitor-0.3.0-darwin-arm64.tar.gz"
      sha256 "c409d03bab98362025103a39ebb4de3bdeff8a2b934789695a3ce84789889a01"
    end
    on_intel do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.3.0/3pitor-0.3.0-darwin-x86_64.tar.gz"
      sha256 "72e846493d34928439b49dd4cbf5a14af1ec49ae2117f23353be5337df90177d"
    end
  end

  def install
    bin.install "3pitor"
  end

  def caveats
    <<~EOS
      3pitor's chat needs ANTHROPIC_API_KEY set, or the claude program installed and signed in.
    EOS
  end

  test do
    assert_equal "3pitor #{version}\n", shell_output("#{bin}/3pitor --version")
    system "codesign", "--verify", "--strict", bin/"3pitor"
  end
end
