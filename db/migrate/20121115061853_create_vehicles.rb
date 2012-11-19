class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :model_id
      t.integer :body_id
      t.integer :actionregistration_id
      t.integer :year

      t.timestamps
    end
  end
end
