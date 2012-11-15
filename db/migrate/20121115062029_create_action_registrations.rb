class CreateActionRegistrations < ActiveRecord::Migration
  def change
    create_table :action_registrations do |t|
      t.integer :customer_id
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
