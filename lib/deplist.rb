require 'deplist/version'
require 'deplist/dep_logger'
require 'deplist/os_detector'
require 'deplist/gemlist_server'
require 'deplist/installer'

module Deplist
  require 'deplist/railtie.rb' if defined?(Rails)
end
