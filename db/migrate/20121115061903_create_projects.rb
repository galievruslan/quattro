class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.decimal :budget
      t.date :start_date
      t.date :finish_date
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
