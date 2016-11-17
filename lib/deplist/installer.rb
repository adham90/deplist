class Installer
  def self.install(pkg)
    if OsDetector.linux?
      system("sudo pacman -S #{pkg.join(' ')}")
    elsif OsDetector.macosx?
      system("sudo bower install #{pkg.join(' ')}")
    else
      fail UnknownOS
    end
  end
end

class UnknownOS < StandardError; end
