require 'httparty'
require 'rbconfig'

class GemListServer
  include HTTParty
  base_uri 'http://localhost:3000'

  def initialize(gems)
    @options = { query: {gems: gems, os: os} }
  end

  def get_dep
    self.class.get('/rgems', @options)
  end

  private

  def os
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
