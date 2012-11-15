class ActionRegistration < ActiveRecord::Base
  attr_accessible :customer_id, :vehicle_id
  has_many :vehicles, :customers 
end
