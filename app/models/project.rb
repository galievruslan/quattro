class Project < ActiveRecord::Base
  attr_accessible :budget, :description, :finish_date, :start_date, :vehicle_id
  has_only :vehicle
  validates :description, :presence => true
  validates :vehicle_id, :presence => true
end
