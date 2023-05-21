class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to "/restaurants/#{@restaurant.id}"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurant_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
