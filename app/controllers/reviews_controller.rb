class ReviewsController < ApplicationController
  before_action :set_restaurant

  def index
  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = @restaurant.reviews
  end

  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

  def set_restaurant
    @restaurant = Restaurant.find([:restaurant_id])
  end
end
