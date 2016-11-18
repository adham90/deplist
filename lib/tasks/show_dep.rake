require 'bundler'
require 'colorize'

namespace :system_dependencies do
  desc "TODO"
  task :show => :environment do
    # get a list of project gems
    gems     = Bundler.load.specs.map { |spec| spec.name }
    packages = GemListServer.new(gems).get_dependencies
    abort "Life is good ;D".green if packages.empty?

    puts "Your system need to have this packages to be able to run your rails project:".yellow
    puts packages.join(', ').red
    puts "Do you want to install missing dependencies(y/n)?".blue

    begin
      if get_input
        Installer.install(packages)

        puts 'Life is better now, Goodbye my friend ;D'.green
      end

    rescue UnknownOS
      puts "Unknown OS".red
    end
  end

  def get_input
    STDOUT.flush
    input = STDIN.gets.chomp
    case input
    when "Y", 'y', "\r"
      return true
    else
      puts 'Bye Bye My Friend'
      return false
    end
  end
end
