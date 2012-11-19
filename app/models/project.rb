class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date
  has_and_belongs_to_many :vehicles
  validates :description, :presence => true
end
