class ProjectPhoto < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :default, :retained_image, :remove_image, :image, :image_name, :image_uid, :project_id

  belongs_to :project 
  image_accessor :image

  #one convenient method to pass jq_upload the necessary information
  def to_jq_upload
    {
      "id" => read_attribute(:id),
      "name" => read_attribute(:image_name),
      "size" => image.size,
      "url" => image.url,
      "default" => read_attribute(:default),
      "thumbnail_url" => image.thumb('80x80#').url,
      "delete_url" => administration_project_photo_path(:id => id),
      "delete_type" => "DELETE"
    }
  end
end
