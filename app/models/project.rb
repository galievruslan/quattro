class Project < ActiveRecord::Base
  attr_accessible :description, :finish_date, :retained_project_image, :remove_project_image, :project_image
  has_and_belongs_to_many :vehicles

  image_accessor :project_image
  validates :description, :presence => true
end
