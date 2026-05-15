class Orbital < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/orbital"
  version "0.2.1"

  on_arm do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.1/orbital_darwin_arm64"
    sha256 "8177f160812f16240cbd3ac6d873c846888d61e41d74b486c444a670e3da77c9"
  end
  on_intel do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.1/orbital_darwin_amd64"
    sha256 "a544be4e44c35200fdc3c2c3f1705ab4e1549ea3c87f9a89f48ac0aaf5e7e1f8"
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