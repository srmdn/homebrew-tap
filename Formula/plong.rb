class Plong < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/plong"
  version "0.2.3"

  on_arm do
    url "https://github.com/srmdn/plong/releases/download/v0.2.3/plong_darwin_arm64"
    sha256 "5a92212300414b094b59cb82005f0f02460f8189d4250fda8be76b45aa2b38e2"
  end
  on_intel do
    url "https://github.com/srmdn/plong/releases/download/v0.2.3/plong_darwin_amd64"
    sha256 "50ae15bf3221567b999bac3a9a25f01ee824a7aef3ef0306b75d2a1a4d839d31"
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
