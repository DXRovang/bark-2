class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all

    # @restaurant_hash = {}

    # @restaurants.each do |restaurant|
    #   @rating = 0
    #   @reviews = restaurant.reviews
    #   @reviews.each do |r|
    #     @rating = @rating + r.rating
    #   end
    #   @rating = (@rating.to_f/@reviews.length).round(1)
    #   if @rating.to_f.nan?
    #     @rating = 0
    #   end
    #   @restaurant_hash[@rating.to_f] = restaurant.id
    # end

    # @sorted_hash = @restaurant_hash.sort_by {|k,v| k}.reverse
    # @sorted_restaurants = []
    # @sorted_hash.each do |h|
    #   @sorted_restaurants.push(Restaurant.find_by(id: h[1]))
    # end
 
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @reviews = @restaurant.reviews.sort_by(&:created_at).reverse
    @rating = 0
    @reviews.each do |r|
      @rating = @rating + r.rating
    end
    @rating = (@rating.to_f/@reviews.length).round(1)

    @new_review = Review.new if current_user
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    # binding.pry
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    # binding.pry

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    respond_to do |format|
      # binding.pry
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.includes(:reviews).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :images=>[])
    end
end
