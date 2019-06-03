class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new()
    @favorite.dish = Dish.find(params[:dish_id])
    @favorite.user = current_user
    @favorite.save
    redirect_to dish_path(@favorite.dish)
  end

  def destroy
    favorite = Favorite.find_by(dish_id: params[:dish_id])
    favorite.delete
    redirect_to dish_path(params[:dish_id])
  end
end
