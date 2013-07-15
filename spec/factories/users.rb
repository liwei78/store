FactoryGirl.define do
  factory :user do
    email 'owner@store.com'
    password '123456'
    password_confirmation '123456'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end