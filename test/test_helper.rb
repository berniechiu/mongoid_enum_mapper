$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require 'mongoid'
require 'enum_mapper'

# Test models
require 'models/order_delivery'

require 'minitest/autorun'
