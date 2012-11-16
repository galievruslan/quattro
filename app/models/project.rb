class Project < ActiveRecord::Base
  attr_accessible :budget, :description, :finishDate, :startDate, :vehicle_id
  has_many :vehicle
  validates :budget, :presence => true
  validates :description, :presence => true
  validates :finishDate, :presence => true
  validates :startDate, :presence => true
  validates :vehicle_id, :presence => true
end
