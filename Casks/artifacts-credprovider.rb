cask "artifacts-credprovider" do
  version "1.4.1"
  sha256 "19c057826d47d1327cb1fec38c0b9ad15ed6c00ee5113aae0993c7f22a2d877d"

  url "https://github.com/microsoft/artifacts-credprovider/releases/download/v#{version}/Microsoft.Net8.osx-arm64.NuGet.CredentialProvider.zip"

  name "artifacts-credprovider"
  desc "Interactively acquire credentials for Azure Artifacts feeds"
  homepage "https://github.com/microsoft/artifacts-credprovider"

  postflight do
    stable_path = "#{HOMEBREW_PREFIX}/opt/artifacts-credprovider"
    FileUtils.rm_f stable_path
    FileUtils.ln_s staged_path, stable_path
    plugin_path = "#{Dir.home}/.nuget/plugins/netcore"
    FileUtils.mkdir_p plugin_path
    FileUtils.rm_f "#{plugin_path}/CredentialProvider.Microsoft"
    FileUtils.ln_s "#{stable_path}/plugins/netcore/CredentialProvider.Microsoft", "#{plugin_path}/CredentialProvider.Microsoft"
  end

  uninstall_postflight do
    FileUtils.rm_f "#{HOMEBREW_PREFIX}/opt/artifacts-credprovider"
    FileUtils.rm_f "#{Dir.home}/.nuget/plugins/netcore/CredentialProvider.Microsoft"
  end
end
