class Orbital < Formula
  desc "macOS disk cleanup tool with developer awareness"
  homepage "https://github.com/srmdn/orbital"
  version "0.2.0"

  on_arm do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.0/orbital_darwin_arm64"
    sha256 "2fb8c92bf4fd1da6be0633d62aa7f65e219d6203faed9e9e1a9cd76256609a94"
  end
  on_intel do
    url "https://github.com/srmdn/orbital/releases/download/v0.2.0/orbital_darwin_amd64"
    sha256 "61dd9279703b2717d05a49cee6df508d67bfbdfae75743dc134687cabafc3360"
  end

  def install
    on_arm do
      bin.install "orbital_darwin_arm64" => "orbital"
    end
    on_intel do
      bin.install "orbital_darwin_amd64" => "orbital"
    end
  end

  test do
    assert_match "orbital", shell_output("#{bin}/orbital version")
  end
end