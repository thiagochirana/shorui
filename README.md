# Shorui

[![Gem Version](https://badge.fury.io/rb/shorui.svg)](https://badge.fury.io/rb/shorui)

Shorui is a Ruby gem that automatically generates API documentation by analyzing your Rails routes. It creates a clean, organized README.md file with detailed endpoint information.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shorui'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install shorui
```

## Usage

Shorui provides two Rake tasks:

1. Generate full documentation including Rails routes:
```bash
rails shorui:generate
```

2. Generate documentation excluding Rails routes:
```bash
rails shorui:generate:no_rails_routes
```

The gem will automatically:
- Analyze your Rails routes
- Extract controller and action information
- Identify required and optional parameters
- Generate a formatted README.md in your project root
- Include HTTP verbs, paths, and parameter details

## Output Format

The generated README.md will follow this structure:

```markdown
# Your Project Name API Documentation

#### [HTTP_VERB] /path/to/endpoint
- **Controller#Action:** `controller_name#action_name`
- **Required Params:** `param1, param2` (if any)
- **Optional Params:** `param1, param2` (if any)
```

## Features

- Automatic route analysis
- Clean and consistent documentation format
- Support for all HTTP verbs
- Parameter identification (required and optional)
- Rails route filtering option
- Proper handling of namespaced routes
- Automatic project name formatting

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thiagochirana/shorui. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of Conduct

Everyone interacting in the Shorui project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Origins

"Shorui" (書類) means "document" in Japanese, reflecting the gem's purpose of automatic documentation generation.