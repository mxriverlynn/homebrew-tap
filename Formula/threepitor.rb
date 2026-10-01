class Threepitor < Formula
  desc "Markdown blog-post editor with Claude built in"
  homepage "https://github.com/mxriverlynn/3Pitor"

  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.2.0/3pitor-0.2.0-darwin-arm64.tar.gz"
      sha256 "895a85365250d657a2f9addf96eb7b29d8a39e91a1439364e776e208d9574d9c"
    end
    on_intel do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.2.0/3pitor-0.2.0-darwin-x86_64.tar.gz"
      sha256 "60fc2a8d3a273d00c49c989ade62bbccd4a6769e6a5818a893be5fc67ad962ce"
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
