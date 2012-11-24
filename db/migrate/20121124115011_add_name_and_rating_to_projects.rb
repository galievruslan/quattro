class AddNameAndRatingToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :name, :string
    add_column :projects, :rating, :integer
  end
end
