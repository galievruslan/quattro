class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :description
      t.date :finish_date

      t.timestamps
    end
  end
end
