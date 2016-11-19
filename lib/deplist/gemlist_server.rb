require 'httparty'
require 'json'

class GemListServer
  include HTTParty
  base_uri 'https://gemdep.herokuapp.com'
  # base_uri 'http://localhost:3000'

  def initialize(gems)
    @options = { query: { gems: gems, os: OsDetector.current_os } }
  end

  def dependencies
    system_dependencies = self.class.get('/dependencies', @options)
    system_dependencies = JSON.parse(system_dependencies.to_json)
    system_dependencies.select! { |pkg| !pkg_exists?(pkg) }
    system('clear')

    system_dependencies
  end

  private

  def pkg_exists?(pkg)
    system("which #{pkg}")
  end
end
