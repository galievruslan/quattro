class ActionRegistration < ActiveRecord::Base
  attr_accessible :customer_id, :vehicle_id
  has_many :vehicles
  has_many :customers
  validates :customer_id, :presence => true
  validates :vehicle_id, :presence => true
end
