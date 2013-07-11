class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer  :user_id
    	t.integer  :store_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
