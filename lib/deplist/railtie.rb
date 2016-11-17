require 'deplist'
require 'rails'
module YourGem
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/show_dep.rake'
    end
  end
end
