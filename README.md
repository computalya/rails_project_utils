# RailsProjectUtils

All my Ruby on Rails projects include same scripts:

```bash
bin
├── run
├── scripts
│   ├── ci
│   ├── cleanup
│   ├── dockerdown
│   ├── dockerup
│   ├── qualitycheck
│   ├── server
│   └── setup
```

With this gem it makes it easier to install and maintain between many projects

## TODO

- Put your Ruby code in the file `lib/rails_project_utils`.
- To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Creating new version

```bash
gem build rails_project_utils.gemspec -o pkg/rails_project_utils-0.1.0.gem
```

### Installing and uninstalling local gem

```bash
gem install pkg/rails_project_utils-0.1.0.gem
```

to uninstall:

```bash
gem uninstall rails_project_utils
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rails_project_utils. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/rails_project_utils/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the RailsProjectUtils project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rails_project_utils/blob/main/CODE_OF_CONDUCT.md).
