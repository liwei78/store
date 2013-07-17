class Store < ActiveRecord::Base
  attr_accessible :description, :title, :closed, :user_id, :subdomain
  
  validates :title, :subdomain, presence: true
  validates :subdomain, uniqueness: true

  validates :subdomain, :format => { :with => /\A[a-zA-Z0-9-]+\z/, :message => "Only letters and '-' allowed" }
  validates :subdomain, length: {in: 3..20}

  belongs_to :user
  has_many :products
end
