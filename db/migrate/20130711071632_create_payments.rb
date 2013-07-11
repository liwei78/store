class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :number
      t.decimal :amount

      t.timestamps
    end
  end
end
