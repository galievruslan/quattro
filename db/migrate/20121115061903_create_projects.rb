class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :description
      t.date :finish_date

      t.timestamps
    end
  end
end
