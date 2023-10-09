# Solidus Address Name

[![CircleCI](https://circleci.com/gh/nebulab/solidus_address_name.svg?style=shield)](https://circleci.com/gh/nebulab/solidus_address_name)
[![codecov](https://codecov.io/gh/solidusio-contrib/solidus_address_name/branch/master/graph/badge.svg)](https://codecov.io/gh/solidusio-contrib/solidus_address_name)

Without this gem, when you'll update to solidus v3, you'll have failures setting `firstname` and `lastname` on
`Spree::Address` records because of their deprecation in Solidus v2.11 and removal in Solidus v3.0

Ref:
* https://github.com/solidusio/solidus/pull/3584
* https://github.com/solidusio/solidus/issues/3234

This gem provides backwards compatibility to that change by allowing `firstname`, `lastname` to work as earlier
along with `name`

## Installation

Add solidus_address_name to your Gemfile:

```ruby
gem 'solidus_address_name'
```

Bundle your dependencies and run the installation generator:

```shell
bin/rails generate solidus_address_name:install
```

## Usage
Only installing the extension and running the install generator should suffice.
You should be able to continue getting & setting names as before

```ruby
address.firstname = 'John' # or first_name
address.lastname = 'Doe' # or last_name
address.valid? # true

address.name = 'John Doe'
address.valid? # true
```


## Development

### Testing the extension

First bundle your dependencies, then run `bin/rake`. `bin/rake` will default to building the dummy
app if it does not exist, then it will run specs. The dummy app can be regenerated by using
`bin/rake extension:test_app`.

```shell
bin/rake
```

To run [Rubocop](https://github.com/bbatsov/rubocop) static code analysis run

```shell
bundle exec rubocop
```

When testing your application's integration with this extension you may use its factories.
You can load Solidus core factories along with this extension's factories using this statement:

```ruby
SolidusDevSupport::TestingSupport::Factories.load_for(SolidusAddressName::Engine)
```

or, if you're not using `SolidusDevSupport`:

```ruby
require 'solidus_address_name/testing_support/factories'
```

### Running the sandbox

To run this extension in a sandboxed Solidus application, you can run `bin/sandbox`. The path for
the sandbox app is `./sandbox` and `bin/rails` will forward any Rails commands to
`sandbox/bin/rails`.

Here's an example:

```
$ bin/rails server
=> Booting Puma
=> Rails 6.0.2.1 application starting in development
* Listening on tcp://127.0.0.1:3000
Use Ctrl-C to stop
```

### Releasing new versions

Please refer to the [dedicated page](https://github.com/solidusio/solidus/wiki/How-to-release-extensions) in the Solidus wiki.

## License

Copyright (c) 2023 Michelle Crisologo, released under the New BSD License.
