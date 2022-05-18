require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase

  test "should not save restaurant without a name" do
    restaurant = Restaurant.new
    assert_not restaurant.save, "saved the restaurant without a name"
  end

  test "should be true" do
    assert false
  end

end
