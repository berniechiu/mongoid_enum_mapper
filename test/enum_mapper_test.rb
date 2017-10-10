require "test_helper"

class Mongoid::EnumMapperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil Mongoid::EnumMapper::VERSION
  end
end
