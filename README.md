# Deplist

Collects the project dependencies and operating system information, sends them to the web service, and displays the required system libraries to install and ask to install them.

## How DepList works:

DepList detects missing system dependencies of gems you are using in your Rails project. It sends them to an external API which responds with a list of dependencies that your system needs to be able to run your project. DepList also asks you to add a list of dependencies for gems that it could not identify, and sends them back to the external API to populate its knowledge base.

    NOTE:
    DepList will not ask you to install system packages you already have.
    In case DepList fails to install any packages, it will let you know the name of
    the packages so you can install them manually.
    DepList keeps a log of all its operations in `log/deplist.log`.

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

    $ rake deplist:show

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adham90/deplist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
