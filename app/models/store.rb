class Store < ActiveRecord::Base
  attr_accessible :description, :title, :closed
end
