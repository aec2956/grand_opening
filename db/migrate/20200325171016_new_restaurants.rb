class NewRestaurants < ActiveRecord::Migration[5.2]
  def change

    create_table :restaurants do |t|
      t.string :name 
      t.text :description 
      t.string :address
      t.string :city 
      t.string :state 
      t.string :zipcode 
      t.string :telephone 
      t.string :hours
    end 
    
    create_table :opening do |t|
      t.string :date 
    end

  end
end
