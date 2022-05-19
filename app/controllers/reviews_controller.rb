class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(params[:review].permit(:rating, :comment))
    @review.user = current_user
    respond_to do |format|
      if @review.save
        OwnerNotificationMailer.with(user: @review.user).owner_notification_email.deliver_later
        format.html 
      end
    end  
    redirect_to restaurant_path(@restaurant) 
  end

def destroy
    @restaurant = Restaurant.find(params[:id])
    @review = @restaurant.reviews.find(params[:restaurant_id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
end
end
