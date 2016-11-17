class Installer
  def self.install(pkg)
    system("sudo pacman -S #{pkg.join(' ')}") if OsDetector.linux?
    system("sudo bower install #{pkg.join(' ')}") if OsDetector.macosx?
  end
end
