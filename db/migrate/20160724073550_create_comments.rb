class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :listing_id
      t.string :comment
      t.decimal :rating

      t.timestamps null: false
    end
  end
end
