require 'httparty'
require 'json'

class GemListServer
  include HTTParty
  base_uri 'https://gemdep.herokuapp.com'

  def initialize(gems)
    @options = { query: {gems: gems, os: OsDetector.current_os} }
  end

  def get_dep
    res = self.class.get('/dependencies', @options)

    JSON.parse(res.to_json)
  end
end
