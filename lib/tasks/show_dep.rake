require 'bundler'

namespace :dep do
  desc "TODO"
  task :show => :environment do
    gems = Bundler.load.specs.map { |spec| spec.name }
    server = GemListServer.new(gems)
    puts server.get_dep
    # puts gems
  end
end
