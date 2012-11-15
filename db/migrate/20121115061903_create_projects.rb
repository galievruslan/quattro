class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.float :budget
      t.date :startDate
      t.date :finishDate
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
