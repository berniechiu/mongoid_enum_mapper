# Mongoid Enum Mapper

Inspired by [ActiveRecord::Enum](http://api.rubyonrails.org/v5.1/classes/ActiveRecord/Enum.html), the library supports a lightweight solution to map enum key value

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid_enum_mapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_enum_mapper

## Usage

```ruby
# Allow Mongoid to have ActiveRecord like Enum type of Mapping

#=> OrderDelivery.rb Model
include Mongoid::EnumMapper
define_enum :status, { pending: 0, shipping: 1, shipped: 2 }

# Examples
od = OrderDelivery.new
od.status             #=> :pending
od.status = :shipping #=> :shipping
od.status             #=> :shipping
od[:status]           #=> 1
od.status = :invalid  #=> :invalid
od.status             #=> :shipping
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berniechiu/mongoid_enum_mapper.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
