require "deplist/version"
require "deplist/gemlist_server"

module Deplist
  require "deplist/railtie.rb" if defined?(Rails)
  require "deplist/gemlist_server.rb"
end
