class Plong < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/plong"
  version "0.2.5"

  on_arm do
    url "https://github.com/srmdn/plong/releases/download/v0.2.5/plong_darwin_arm64"
    sha256 "aaa7380f728e4d41b356b4de004540dd3c5d38e4c7fb1d452b7e7274c46653a0"
  end
  on_intel do
    url "https://github.com/srmdn/plong/releases/download/v0.2.5/plong_darwin_amd64"
    sha256 "a598ea74531a734a0f4ca61298671a2d164be94da4e3202b082af388727877bd"
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
