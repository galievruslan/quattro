class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :name, :rating
  has_and_belongs_to_many :vehicles
  has_many :project_photos
  has_and_belongs_to_many :services
  validates :description, :presence => true
end
