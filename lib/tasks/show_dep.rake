require 'bundler'
require 'colorize'

namespace :system_dependencies do
  desc 'TODO'
  task show: :environment do
    # get a list of project gems
    gems         = Bundler.load.specs.map(&:name)
    server       = GemListServer.new(gems)
    packages     = server.dependencies
    unknown_gems = server.unknown_gems

    unless unknown_gems.empty?
      # TODO: change this message
      puts "I don't know this gems can you tell"\
        'me what dependencies they need if you know(y/n)?'.yellow
      puts unknown_gems.join(', ').red

      if user_input
        puts 'To abort type exit.'.yellow
        puts 'To add multiple dependencies use ex(pkg1,pkg2).'.yellow
        unknown_gems.each do |unknown_gem|
          # TODO: Change this message
          print "What about (#{unknown_gem}): ".yellow
          STDOUT.flush
          dependencies = STDIN.gets.chomp.split(/[\s,]+/)
          break if dependencies == ['exit']
          next if dependencies.empty?

          server.create(unknown_gem, dependencies)
          packages = packages.concat(dependencies)
        end
      end
    end

    abort 'Life is good ;D'.green if packages.empty?

    puts 'Your system need to have this packages'\
      ' to be able to run your rails project:'.yellow
    puts packages.join(', ').red
    puts 'Do you want to install missing dependencies(y/n)?'.blue

    begin
      if user_input
        status = Installer.install(packages)
        system('clear')

        unless status[:success].empty?
          puts 'I have installed this packages for you :)'.yellow
          puts status[:success].join(', ').green
          puts
        end

        unless status[:fail].empty?
          puts "I'm sorry i can't install this packages :(".yellow
          abort status[:fail].join(', ').red
        end

        abort 'Life is better now, Goodbye my friend ;D'.green
      end

    rescue UnknownOS
      puts 'Unknown OS'.red
    end
  end

  def user_input
    STDOUT.flush
    input = STDIN.gets.chomp
    case input
    when 'Y', 'y', "\r"
      return true
    else
      puts 'Bye Bye My Friend'
      return false
    end
  end
end
