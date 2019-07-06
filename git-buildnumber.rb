# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class GitBuildnumber < Formula
  desc "Create a continuous, consistent buildnumber independent of branch."
  homepage "https://github.com/hpoul/git-buildnumber"
  url "https://github.com/hpoul/git-buildnumber/archive/v1.0.tar.gz"
  sha256 "6c8a84911bc5dc348d55192122c3f0d6b40c9c3ab23c2edc7f3bad21cad65813"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    bin.install "git-buildnumber.sh"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test git-buildnumber`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    assert_match "git-buildnumber, version", shell_output("#{bin}/git-buildnumber.sh")
  end
end
