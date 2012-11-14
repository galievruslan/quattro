class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |c|
      c.string :value
      c.timestamps

      # class type needed for STI
      c.string :type
    end
  end

  def self.down
  	drop_table :contacts
  end
end
