cask "pycharm-ce-with-anaconda-plugin" do
  version "2020.3.1,203.6682.86"
  sha256 "9a7c2e430a2da1620f9e0ae7b0cabc8ae5826aba36dfac50493e6384ccaccfc7"

  url "https://download.jetbrains.com/python/pycharm-community-anaconda-#{version.before_comma}.dmg"
  appcast "https://data.services.jetbrains.com/products/releases?code=PCC&latest=true&type=release"
  name "Jetbrains PyCharm Community Edition with Anaconda plugin"
  name "PyCharm CE with Anaconda plugin"
  desc "PyCharm IDE with Anaconda plugin"
  homepage "https://www.jetbrains.com/pycharm/promo/anaconda"

  auto_updates true

  app "PyCharm CE with Anaconda plugin.app"

  uninstall_postflight do
    ENV["PATH"].split(File::PATH_SEPARATOR).map { |path| File.join(path, "charm") }.each do |path|
      if File.exist?(path) &&
         File.readlines(path).grep(/# see com.intellij.idea.SocketLock for the server side of this interface/).any?
        File.delete(path)
      end
    end
  end

  zap trash: [
    "~/Library/Application Support/PyCharm#{version.major_minor}",
    "~/Library/Caches/PyCharmCE#{version.major_minor}",
    "~/Library/Caches/PyCharm#{version.major_minor}",
    "~/Library/Logs/PyCharm#{version.major_minor}",
    "~/Library/Logs/PyCharmCE#{version.major_minor}",
    "~/Library/Preferences/PyCharm#{version.major_minor}",
    "~/Library/Preferences/PyCharmCE#{version.major_minor}",
    "~/Library/Saved Application State/com.jetbrains.pycharm.savedState",
  ]
end
