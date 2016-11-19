require 'rbconfig'
class OsDetector
  class << self
    def current_os
      os_name
    end

    def linux?
      os_name == 'linux'
    end

    def macosx?
      os_name == 'macosx'
    end

    def unknown?
      os_name == 'unknown'
    end

    private

    def os_name
      @os ||= begin
        host_os = RbConfig::CONFIG['host_os']
        case host_os
        when /darwin|mac os/
          'macosx'
        when /linux/
          'linux'
        else
          'unknown'
        end
      end
    end
  end
end
