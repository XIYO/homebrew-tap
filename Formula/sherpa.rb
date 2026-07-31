class Sherpa < Formula
  desc "Local-first personal assistant for macOS"
  homepage "https://github.com/XIYO/plug-hole"
  url "https://github.com/XIYO/plug-hole/releases/download/sherpa-v0.2.1/sherpa-v0.2.1-cli-macos-universal.tar.gz"
  sha256 "402e6dc84f3c5fdb9a1402ee970896719c72dc95b2b610c32649d1830f15f11f"
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
