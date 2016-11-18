require 'bundler'

namespace :system_dependencies do
  desc "TODO"
  task :show => :environment do
    # get a list of project gems
    gems     = Bundler.load.specs.map { |spec| spec.name }
    packages = GemListServer.new(gems).get_dependencies
    abort "You're good to go :D" if packages.empty?

    puts "Your system need to have this packages to be able to run your rails project:"
    puts packages.join(', ')
    puts "Do you want to install missing dependencies(Y/n)?"

    begin
      Installer.install(packages) if get_input
    rescue UnknownOS
      puts "Unknown OS"
    end
  end

  def get_input
    STDOUT.flush
    input = STDIN.gets.chomp
    case input
    when "Y", 'y', "\r"
      return true
    when "N", 'n', "\e"
      return false
    else
      return false
    end
  end
end
