# Chronoton

Chronoton is a small cli that allows you to specify time based scaling rules via a yaml file
and to periodically check the rules and send potential changes to a foreman gantry crane
installation



## Installation

Download the repository

```
git clone git@github.com:TimKaechele/Chronoton.git
```

Install dependencies

```
bundle install --path=vendor/bundle
```

Build the gem

```
bundle exec rake build
```

Install the gem

```
gem install ./pkg/path/to/gem.pkg
```

## Usage

Create a yaml file with the following contents:

```yaml
default: 4
rules:
  - from: '08:00'
    to: '13:00'
    capacity: 8
  - from: '15:00'
    to: '19:00'
    capacity: 3
```

Replace the rules and default capacity with your desired capacities.

Find the auth token of your auto scaling group in foreman gantry crane

Exectute the following command on your command line and replace the url as well as the auth token
with the correct values.

```
chronoton /path/to/your/yaml/file.yml http://foreman.example.com/gantry_crane/api/v1/auto_scaling_groups/{{ auth_token }}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timkaechele/chronoton. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Chronoton project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/timkaechele/chronoton/blob/master/CODE_OF_CONDUCT.md).
