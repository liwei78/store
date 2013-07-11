class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.integer  :store_id
    	t.integer  :order_id
    	t.integer  :user_id
      t.string :number
      t.decimal :amount

      t.timestamps
    end
  end
end
