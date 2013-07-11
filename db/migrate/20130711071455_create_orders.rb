class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.integer  :user_id
    	t.integer  :store_id
      t.string :number
      t.decimal :amount

      t.timestamps
    end
  end
end
