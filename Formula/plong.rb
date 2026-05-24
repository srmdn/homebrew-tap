class Plong < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/plong"
  version "0.2.4"

  on_arm do
    url "https://github.com/srmdn/plong/releases/download/v0.2.4/plong_darwin_arm64"
    sha256 "71c308f17e86ecbaff2146d2cded6189ea3c9e96631f802cbcae69aaf621cfb6"
  end
  on_intel do
    url "https://github.com/srmdn/plong/releases/download/v0.2.4/plong_darwin_amd64"
    sha256 "1260bccdc75f162f3101276509831d93742c63664304bd9f9b321ee710996ffb"
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
