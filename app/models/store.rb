class Store < ActiveRecord::Base
  attr_accessible :description, :title, :closed, :permalink, :user_id
  validates :title, :permalink, presence: true

  belongs_to :user
end
