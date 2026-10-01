class Sherpa < Formula
  desc "Local-first planning and context orchestrator for macOS"
  homepage "https://github.com/XIYO/sherpa"
  url "https://github.com/XIYO/sherpa/releases/download/v0.7.1/sherpa-0.7.1-aarch64-apple-darwin.tar.gz"
  version "0.7.1"
  sha256 "70c4cb18b4e3ce3e58f92c88844a05a898cb17c7af5f3b3e6ba2812558aa7a48"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "sherpa"
  end

  def caveats
    <<~EOS
      Sherpa is installed without Developer ID or notarization.
      macOS may ask for Calendar, Reminders, or automation permission when used.

      Agent skills are not bundled with this CLI. Install them separately:
        claude plugin marketplace add https://github.com/XIYO/sherpa.git
        claude plugin install sherpa@sherpa
    EOS
  end

  test do
    # 스킬의 버전 가드가 이 출력 형식에 기댄다.
    assert_equal "sherpa #{version}", shell_output("#{bin}/sherpa --version").strip
    assert_match "sherpa kakaotalk archive", shell_output("#{bin}/sherpa --help")
  end
end
