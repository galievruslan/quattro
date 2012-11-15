class Project < ActiveRecord::Base
  attr_accessible :budget, :description, :finishDate, :startDate, :vehicle_id
  has_many :vehicle
end
