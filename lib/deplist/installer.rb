class Installer
  class << self
    def install(packages)
      raise UnknownOS if OsDetector.unknown?

      setup(packages, OsDetector.current_os)
    end

    private

    def setup(packages, os)
      success_list = []
      fail_list    = []

      packages.each do |pkg|
        status = send("#{os}_install", pkg)

        if status
          DepLogger.info("Succeeded to install: #{pkg}")
          success_list << pkg
        else
          DepLogger.error("Failed to install: #{pkg}")
          fail_list << pkg
        end
      end

      { success: success_list, fail: fail_list }
    end

    def linux_install(pkg)
      # TODO: change pacman to 'apt-get -y install'
      system("sudo pacman -S #{pkg} --noconfirm")
    end

    def macosx_install(pkg)
      system("bower install #{pkg} --no-interactive")
    end
  end
end

class UnknownOS < StandardError; end
