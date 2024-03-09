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

Using this gem simplifies the process of installing and maintaining these scripts across multiple projects, ensuring consistency and ease of management.

### for more advanced version have look at:

- https://github.com/casey/just
- https://everydayrails.com/2024/02/24/rails-just-commands

## Installation

```bash
cd <rails-projects-folder>
bundle add rails_project_utils

# to finish installation
rails generate rails_project_utils
```

## Usage

```bash
bin/run
# Usage: bin/run <command>
# Available commands: ci, cleanup, dockerdown, dockerup, qualitycheck, server, setup

bin/run cleanup
bin/run setup
# etc.
```

## Uninstallation

```bash
cd <rails-projects-folder>
rails generate rails_project_utils:uninstall

bundle remove rails_project_utils
```

## Development

- [ ] update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

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
