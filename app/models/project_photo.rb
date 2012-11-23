class ProjectPhoto < ActiveRecord::Base
  attr_accessible :default, :retained_image, :remove_image, :image, :image_name, :image_uid, :project_id

  belongs_to :project 
  image_accessor :image
end
