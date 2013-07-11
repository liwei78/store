class CreateShippments < ActiveRecord::Migration
  def change
    create_table :shippments do |t|
      t.string :number

      t.timestamps
    end
  end
end
