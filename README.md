[![Gem Version](https://badge.fury.io/rb/mongoid_enum_mapper.svg)](https://badge.fury.io/rb/mongoid_enum_mapper)
[![Maintainability](https://api.codeclimate.com/v1/badges/919d0459a7ffdfa9a221/maintainability)](https://codeclimate.com/github/berniechiu/mongoid_enum_mapper/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/919d0459a7ffdfa9a221/test_coverage)](https://codeclimate.com/github/berniechiu/mongoid_enum_mapper/test_coverage)
[![Build Status](https://travis-ci.org/berniechiu/mongoid_enum_mapper.svg?branch=master)](https://travis-ci.org/berniechiu/mongoid_enum_mapper)

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
od.status             #=> Default :pending
od.status = :shipping #=> :shipping
od.status             #=> :shipping
od[:status]           #=> 1

od.status = :invalid  #=> :invalid
od.status             #=> :shipping

od.update(status: :pending)
od.status             #=> :pending

OrderDelivery::STATUS #=> { pending: 0, shipping: 1, shipped: 2 }
OrderDelivery.update_all(OrderDelivery::STATUS[:shipping])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berniechiu/mongoid_enum_mapper.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
