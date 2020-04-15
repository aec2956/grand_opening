class RestaurantsController < ApplicationController
  
  def index 
    @restaurants = Restaurant.all 
  end 

  def new 
    @restaurant = Restaurant.new
    @regions = Region.all
  end

  def create
    region = Region.find(restaurant_params['region'].to_i)
    new_params = restaurant_params
    new_params['region'] = region
    @restaurant = Restaurant.new(new_params)

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
    @restaurant = Restaurant.find(params[:id])
    @regions = Region.all
  end

  def update
    restaurant = Restaurant.find(params[:id])
    region = Region.find(restaurant_params['region'].to_i)
    update_params = restaurant_params
    update_params['region'] = region
    restaurant.update_attributes(update_params)
    redirect_to restaurant_path(restaurant.id)
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, 
                                        :address, :city, 
                                        :state, :zipcode,
                                        :telephone, :hours, :region)
  end

end