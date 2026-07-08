class Plong < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/plong"
  version "0.2.6"

  on_arm do
    url "https://github.com/srmdn/plong/releases/download/v0.2.6/plong_darwin_arm64"
    sha256 "3596e546f59e62ee52efbf16060c3f07dba04f40cb8bf8b06e7b570c80ed21a1"
  end
  on_intel do
    url "https://github.com/srmdn/plong/releases/download/v0.2.6/plong_darwin_amd64"
    sha256 "a357946ce5f67d48d90d3c488a48794cae55395d13b178b4e7e456c725618239"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "plong_darwin_arm64" => "plong"
    else
      bin.install "plong_darwin_amd64" => "plong"
    end
  end

  test do
    assert_match "plong", shell_output("#{bin}/plong version")
  end
end
