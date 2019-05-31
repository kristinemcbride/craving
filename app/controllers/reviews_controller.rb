class ReviewsController < ApplicationController
  before_action :set_dish

  def create
    @review = Review.new(review_params)
    @review.dish = @dish
    @review.user = current_user
    if @review.save
      @restaurant = @dish.restaurant
      @dish.rating = dish_rating
      @dish.save
      @restaurant.average_rating = restaurant_rating
      @restaurant.save
      redirect_to dish_path(@dish)
    else
      redirect_to dish_path(@dish)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_dish
    @dish = Dish.find(params[:dish_id])
  end

  def dish_rating
    counter = 0
    total_rating = 0
    @dish.reviews.each do |review|
      rating = review.rating
      total_rating += rating
      counter += 1
    end
    return total_rating / counter
  end

  def restaurant_rating
    counter = 0
    total_rating = 0
    @restaurant.dishes.each do |dish|
      rating = dish.rating
      total_rating += rating
      counter += 1
    end
    return total_rating / counter
  end
end
