class Krait < Formula
  desc "GPU-Accelerated DNA Sequence Aligner for short reads using WebGPU"
  homepage "https://github.com/v-zhukovetskyi/krait"
  version "0.1.0"
  license "AGPL-3.0-or-later"

 on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/v-zhukovetskyi/krait/releases/download/v0.1.0/krait-macos-arm64"
      sha256 "f7acfe884e981b5aca599a2b833d8d2f29d758f2919aba9ab0b9a97a9b37cf03"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/v-zhukovetskyi/krait/releases/download/v0.1.0/krait-linux-x86_64"
      sha256 "9b8f3f5a93036dc4a91a75919cb41954ce5c508b062b08130a6efd066b76c13e"
    end
  end

  def install
    binary = OS.mac? ? "krait-macos-arm64" : "krait-linux-x86_64"
    bin.install binary => "krait"
  end

  test do
    assert_match "krait", shell_output("#{bin}/krait --help")
  end
end
