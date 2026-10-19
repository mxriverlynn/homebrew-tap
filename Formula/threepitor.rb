class Threepitor < Formula
  desc "Markdown blog-post editor with Claude built in"
  homepage "https://github.com/mxriverlynn/3Pitor"

  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.4.0/3pitor-0.4.0-darwin-arm64.tar.gz"
      sha256 "04d811fb806bcd43472ff06d070bb9709c14b185a2cab3446dc00197e0475bee"
    end
    on_intel do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.4.0/3pitor-0.4.0-darwin-x86_64.tar.gz"
      sha256 "1d75de7fa2499e0c78a2edad685f1341bd0c5ee50c3e81004a87971175250060"
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
