class GitCredentialAzure < Formula
  desc "Git credential helper for Azure Repos"
  homepage "https://github.com/hickford/git-credential-azure"
  url "https://github.com/hickford/git-credential-azure/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "fefa8e8f011cfc02c86fb9d7178f3d1819eb99ef107aeab877ea550e184b655c"
  license "Apache-2.0"

  bottle do
    root_url "https://ghcr.io/v2/j0057/tap"
    rebuild 2
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "19045d3046532b9783df98689ec6d12aa8951337b7ccbcc81a81c931b56c3c0b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e51ea4e163562a3e1ce0d3c8073940d841099d01eee4d44d286436c2f0521368"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "66a257d25a0573834316cb81113f354c5f964abe2abac1936b6a36d0f34e42a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fe197b35186745d5c19e4a5abcac93062afe08bbf211541f87095a2cc1eab6bf"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}")
  end

  test do
    assert_match "git-credential-azure #{version}", shell_output("#{bin}/git-credential-azure -verbose 2>&1", 2)
  end
end
