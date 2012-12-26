class AddStatusToActionRegistrations < ActiveRecord::Migration
  def change
    add_column :action_registrations, :status, :boolean
  end
end
