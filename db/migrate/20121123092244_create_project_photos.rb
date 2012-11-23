class CreateProjectPhotos < ActiveRecord::Migration
  def change
    create_table :project_photos do |t|
      t.boolean :default
      t.string :image_name
      t.string :image_uid
      t.integer :project_id
      t.timestamps
    end
  end
end
