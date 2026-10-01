class Threepitor < Formula
  desc "Markdown blog-post editor with Claude built in"
  homepage "https://github.com/mxriverlynn/3Pitor"

  depends_on macos: :ventura

  on_macos do
    on_arm do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.1.0/3pitor-0.1.0-darwin-arm64.tar.gz"
      sha256 "f12b6152c2e21293562c92195b83e4b68666fed5e4ff2e249431d5fa2dff8cb6"
    end
    on_intel do
      url "https://github.com/mxriverlynn/3Pitor/releases/download/v0.1.0/3pitor-0.1.0-darwin-x86_64.tar.gz"
      sha256 "b67d56229f8f33314e62b62c4d42fa34008a39ab8b5699514f98135cc1103c18"
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
