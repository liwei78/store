class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.integer  :store_id
    	t.integer  :user_id
      t.string :title

      t.timestamps
    end
  end
end
