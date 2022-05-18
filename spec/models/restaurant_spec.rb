require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  before(:all) do
    @user = User.create(:id=>1, :email=>"email@email.com", :password=>"password")
    @restaurant = Restaurant.create(:name=>"Rosie's", :user_id=>1)
  end

  it 'checks that a restaurant can be created' do 
    expect(@restaurant).to be_valid
  end

  it 'checks that a restaurant can be updated' do
    @restaurant.update(:name => "Jacks")
    expect(Restaurant.find_by(:name=>"Jacks")).to eq(@restaurant)
  end

  it 'checks that a restaurant can be deleted' do
    @restaurant.destroy
    expect(Restaurant.count).to eq(0)
  end

end