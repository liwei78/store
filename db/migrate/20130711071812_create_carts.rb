class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :title

      t.timestamps
    end
  end
end
