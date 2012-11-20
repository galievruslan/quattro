class AddImageColumnsToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :project_image_uid,  :string
	add_column :projects, :project_image_name, :string
  end
end
