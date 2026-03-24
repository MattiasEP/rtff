class Rtff < Formula
  desc "Heavy-metal CLI for semver Git tag releases"
  homepage "https://github.com/MattiasEP/rtff"
  url "https://github.com/MattiasEP/rtff/archive/refs/tags/0.1.0.tar.gz"
  sha256 "c55709aa37b1b7d9f81f3e6f3f1cd412d2a620f6bc297708917fffd1cbfd3904"
  license "MIT"

  head "https://github.com/MattiasEP/rtff.git", branch: "main"

  depends_on "bash"
  depends_on "git"

  def install
    bin.install "rtff"
  end

  test do
    assert_match "RTFF", shell_output("#{bin}/rtff --help")
  end
end
