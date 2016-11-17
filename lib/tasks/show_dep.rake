require 'bundler'

namespace :dep do
  desc "TODO"
  task :show => :environment do
    gems = Bundler.load.specs.map { |spec| spec.name }
    packages = GemListServer.new(gems).get_dep

    sys_dep = packages.map do |pkg|
      pkg['dependencies'].map{ |dep| dep['name'] }
    end

    puts "Your system need to have this packages to be able to run your rails project:"
    puts sys_dep.join(', ')
    puts "Do you want to install missing dependencies(Y/n)?"
    begin
      Installer.install(sys_dep) if get_input
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
