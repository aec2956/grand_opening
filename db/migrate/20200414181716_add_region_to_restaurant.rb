class AddRegionToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_reference :restaurants, :region, foreign_key: true
  end
end
