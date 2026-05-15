class Orbital < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/orbital"
  version "0.2.0"

  on_arm do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.0/orbital_darwin_arm64"
    sha256 "7c347201f24afade1f54f6c6fa2ae2aef0c9856fb98d48d8c78452933543ebc1"
  end
  on_intel do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.0/orbital_darwin_amd64"
    sha256 "6db842bdadd92d5ae91c9c56344c6480f745bfa91090f29891d684f4d86d0a9c"
  end

  def install
    if Hardware::CPU.arm?
      bin.install "orbital_darwin_arm64" => "orbital"
    else
      bin.install "orbital_darwin_amd64" => "orbital"
    end
  end

  test do
    assert_match "orbital", shell_output("#{bin}/orbital version")
  end
end