require 'httparty'
require 'json'

class GemListServer
  include HTTParty
  base_uri 'http://localhost:3000'

  def initialize(gems)
    @options = { query: {gems: gems, os: OsDetector.current_os} }
  end

  def get_dep
    res = self.class.get('/rgems', @options)

    JSON.parse(res.to_json)
  end
end
