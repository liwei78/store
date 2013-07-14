class Product < ActiveRecord::Base
  attr_accessible :description, :title, :store_id
  belongs_to :store
  belongs_to :user


end
