class CreateShippments < ActiveRecord::Migration
  def change
    create_table :shippments do |t|
    	t.integer  :user_id
    	t.integer  :store_id
    	t.integer  :order_id
      t.string :number

      t.timestamps
    end
  end
end
