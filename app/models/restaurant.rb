class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many_attached :images

  validates :name, presence: true 
end

# <%= form_with model: @restaurant, local: true do |form| %>
#   <%= form.text_field :title, placeholder: "Title" %>
#   <%= form.text_area :content %>
#   <%= form.file_field :images, multiple: true %>
#   <%= form.submit %>
#   <% end %>