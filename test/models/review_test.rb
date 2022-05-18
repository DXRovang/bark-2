require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  setup do
    @review = Review.new(
      # :rating => 5, 
      :comment => "hello", 
      :user_id => 1, 
      :restaurant_id => 1)
  end
    
  test "should not save review without a rating" do
    assert_not @review.save, "saved the review without a rating"
  end

end
