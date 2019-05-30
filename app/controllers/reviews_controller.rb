class ReviewsController < ApplicationController
  before_action :set_dish

  def create
    @review = Review.new(review_params)
    @review.dish = @dish
    @review.user = current_user
    @review.save
    redirect_to dish_path(@dish)

    # else
    #   render :new
    # end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_dish
    @dish= Dish.find(params[:dish_id])
  end
end
