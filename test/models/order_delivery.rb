class OrderDelivery
  include Mongoid::Document
  include Mongoid::EnumMapper

  define_enum :status, { pending: 0, shipping: 1, shipped: 2 }
end
