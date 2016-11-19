# Deplist

Collects the project dependencies and operating system information, sends them to the web service, and displays the required system libraries to install and ask to install them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'deplist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deplist

## Usage

Show all system library needed to be able to run your rails application and ask you to install missing dependencies.

    $ rake system_dependencies:show

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adham90/deplist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

