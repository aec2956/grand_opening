class RestaurantsController < ApplicationController
  
  def index 

  end 

  def new 
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save!
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update_attributes(place_params)
    redirect_to root_path
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, 
                                        :address, :city, 
                                        :state, :zipcode,
                                        :telephone, :hours)
  end

end