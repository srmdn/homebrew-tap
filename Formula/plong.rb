class Plong < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/plong"
  version "0.2.2"

  on_arm do
    url "https://github.com/srmdn/plong/releases/download/v0.2.2/plong_darwin_arm64"
    sha256 "25fbcd6b8adba5179fd2cf4e9f6ec7d88a7758ae786a5d1a01c873385be97c13"
  end
  on_intel do
    url "https://github.com/srmdn/plong/releases/download/v0.2.2/plong_darwin_amd64"
    sha256 "907761d466f41dfec78ca91f02c35f7c5c2d667b45622c487a65c6366e765f8f"
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
