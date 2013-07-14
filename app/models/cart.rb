class Cart < ActiveRecord::Base
  attr_accessible :title, :user_id, :store_id, :product_id
  belongs_to :user
  belongs_to :product

end
