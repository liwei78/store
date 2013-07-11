class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
    	t.integer  :user_id
      t.string :title
      t.text :description
      t.boolean :blocked, default: false

      t.timestamps
    end
  end
end
