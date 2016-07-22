class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.string :address
      t.integer :user_id
      t.string :description
      t.string :property_type
      t.integer :no_of_beds
      t.integer :price

      t.timestamps null: false
    end
  end
end
