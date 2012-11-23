class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date 
  has_and_belongs_to_many :vehicles
  has_many :project_photos
  validates :description, :presence => true
end
