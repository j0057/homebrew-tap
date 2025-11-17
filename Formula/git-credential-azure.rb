class GitCredentialAzure < Formula
  desc "Git credential helper for Azure Repos"
  homepage "https://github.com/hickford/git-credential-azure"
  url "https://github.com/hickford/git-credential-azure/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "1f3cd884d110e10ebd1e166f767df6da2981b51db3692a9fe33a53df83376bbf"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/j0057/tap"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4f9d4d2baf0eb6a7452a69db5b5affc137f499268c2cf7dbef0a59f53bcaf92b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8cf3566bd22ec6a6943e7f632b69da546db07c7579ec33ce34561772d9717a53"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "git-credential-azure #{version}", shell_output("#{bin}/git-credential-azure -verbose 2>&1", 2)
  end
end
