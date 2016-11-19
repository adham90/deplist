require 'deplist/version'
require 'deplist/gemlist_server'
require 'deplist/installer'
require 'deplist/os_detector'
require 'deplist/dep_logger'

module Deplist
  require 'deplist/railtie.rb' if defined?(Rails)
end
