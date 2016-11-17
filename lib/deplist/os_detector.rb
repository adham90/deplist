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
      (linux? || macosx?) == false
    end

    private
    def os_name
      @os ||= (
        host_os = RbConfig::CONFIG['host_os']
        case host_os
        when /darwin|mac os/
          'macosx'
        when /linux/
          'linux'
        else
          raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
        end
      )
    end
  end
end
