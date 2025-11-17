class GitCredentialAzure < Formula
  desc "Git credential helper for Azure Repos"
  homepage "https://github.com/hickford/git-credential-azure"
  url "https://github.com/hickford/git-credential-azure/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "1f3cd884d110e10ebd1e166f767df6da2981b51db3692a9fe33a53df83376bbf"
  license "Apache-2.0"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6478e194ec1d86d1de718e7de3a788eeb6db4c8e8d20d2a11da2e040971df5e6"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "git-credential-azure #{version}", shell_output("#{bin}/git-credential-azure -verbose 2>&1", 2)
  end
end
