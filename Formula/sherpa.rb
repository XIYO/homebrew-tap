class Sherpa < Formula
  desc "Local-first personal assistant for macOS"
  homepage "https://github.com/XIYO/plug-hole"
  url "https://github.com/XIYO/plug-hole/releases/download/sherpa-v0.2.0/sherpa-v0.2.0-cli-macos-universal.tar.gz"
  sha256 "7155a89afe3db7b01b687b94e367e3ab57de77f3108cab8bda0be1cf63522339"
  license "MIT"

  depends_on macos: :sonoma

  def install
    bin.install "bin/sherpa"
  end

  test do
    assert_match "sherpa #{version}", shell_output("#{bin}/sherpa --version")
    ENV["PATH"] = "/usr/bin:/bin"
    assert_match "\"release_ref\": \"sherpa-v#{version}\"", shell_output("#{bin}/sherpa install --agent-plugin --json")
  end
end
