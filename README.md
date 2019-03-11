# DeDup

DeDup (de-duplicate) is a simple command line tool to list out duplicate files in a directory. Simply pass in a .zip file of the directory you want to parse and have the duplicate file paths listed as output.

## Installation

Gem is still under development, so to install the gem clone the repo to your local machine and:

```
cd de_dup
bin/setup
bundle exec rake install
```

## Usage

To list out duplicate files following commands are available to be used in console:
```
de_dup_images [zip_file_path]
```

Or if you want to use it from within Ruby:

```
DeDup::Images.process('path_to_zip_file')
```

Several utility methods are available in `DeDup::Utils` module.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/biiishal/de_dup.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
