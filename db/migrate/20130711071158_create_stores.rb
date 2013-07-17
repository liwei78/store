class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
    	t.integer  :user_id
      t.string   :title
      t.text     :description
      t.string   :subdomain
      # admin can clock it
      t.boolean  :blocked, default: false
      # owner can close it
      t.boolean  :closed, default: false

      t.timestamps
    end
  end
end
