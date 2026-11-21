class Sherpa < Formula
  desc "Local-first planning and context orchestrator for macOS"
  homepage "https://github.com/XIYO/sherpa"
  url "https://github.com/XIYO/sherpa/releases/download/v0.8.5/sherpa-0.8.5-aarch64-apple-darwin.tar.gz"
  sha256 "b373f4b0b9d10e50384070879ed531d7287338b7fa0d1d29eed4e80b17f54b04"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :sonoma
  depends_on "sqlcipher"

  def install
    bin.install "bin/sherpa"
    libexec.install "libexec/SherpaHelper.app"
  end

  def caveats
    <<~EOS
      The Apple helper is signed with Developer ID and is not notarized.
      macOS asks once for Calendar, Reminders, or automation permission for
      "Sherpa"; the grant carries over to later upgrades.
      Mail, iMessage, and KakaoTalk reads need Full Disk Access for the app that
      runs sherpa. Run "sherpa kakaotalk setup" once before reading KakaoTalk.

      Agent skills are not bundled with this CLI. Install them separately:
      Your GitHub account needs access to the private XIYO/plug-hole repository.
        claude plugin marketplace add https://github.com/XIYO/plug-hole.git
        claude plugin install sherpa@plug-hole
    EOS
  end

  test do
    # 스킬의 버전 가드가 이 출력 형식에 기댄다. version 은 Homebrew 가 url 에서 읽은 값이다.
    assert_equal "sherpa #{version}", shell_output("#{bin}/sherpa --version").strip
    assert_match "sherpa kakaotalk archive", shell_output("#{bin}/sherpa --help")
    helper = libexec/"SherpaHelper.app/Contents/MacOS/sherpa-apple"
    assert_equal "sherpa-apple #{version}", shell_output("#{helper} --version").strip
    # 코어가 설치 위치의 헬퍼를 찾아 이름 있는 오류로 끝나는지 본다.
    assert_match "protocol.invalid_envelope", pipe_output("#{bin}/sherpa planner request", "{}", 1)
  end
end
