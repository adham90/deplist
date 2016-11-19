require 'httparty'
require 'json'

class GemListServer
  include HTTParty
  base_uri 'https://gemdep.herokuapp.com'
  # base_uri 'http://localhost:3000'

  def initialize(gems)
    @options  = { query: { gems: gems, os: OsDetector.current_os } }
    @packages = load_packages(@options)
  end

  def create(unknown_gem, dependencies)
    options = { body: { gem: unknown_gem, dependencies: dependencies, os: OsDetector.current_os } }

    self.class.post('/system_lib', options)
  end

  def dependencies
    system_dependencies = @packages['dependencies'].select { |pkg| !pkg_exists?(pkg) }
    system('clear')

    system_dependencies
  end

  def unknown_gems
    @packages['unknown']
  end

  private

  def load_packages(options)
    packages = self.class.get('/dependencies', options)
    JSON.parse(packages.to_json)
  end

  def pkg_exists?(pkg)
    system("which #{pkg}")
  end
end
