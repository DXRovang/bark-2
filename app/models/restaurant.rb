class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :images

  validates :name, presence: true 
end

