class DashboardController < ApplicationController
  def show
    @user = current_user
    @favorites = @user.favorites
    @dishes = @user.dishes
  end

  def my_posts
    @user = current_user
    @favorites = @user.favorites
    @dishes = @user.dishes
  end
end
