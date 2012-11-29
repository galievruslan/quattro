class ActionRegistration < ActiveRecord::Base
  attr_accessible :customer_id, :vehicle_id, :vehicle, :customer
  belongs_to :vehicle
  belongs_to :customer
  validates :customer_id, :presence => true
  validates :vehicle_id, :presence => true
end
