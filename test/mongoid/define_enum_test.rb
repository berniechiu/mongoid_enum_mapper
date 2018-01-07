require "test_helper"

class Mongoid::EnumMapper::DefineEnumTest < Minitest::Test
  def test_that_it_can_map_the_enum
    order_delivery = OrderDelivery.new
    assert_kind_of Integer, order_delivery[:status]
    assert_kind_of Symbol, order_delivery.status
    assert_equal :pending, order_delivery.instance_variable_get(:@status)
  end

  def test_that_it_can_change_the_status
    order_delivery = OrderDelivery.new
    order_delivery.status = :shipping
    assert_equal 1, order_delivery[:status]
    assert_equal :shipping, order_delivery.status
  end
end
