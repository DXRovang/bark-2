class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :rating, :comment, presence: true
end

