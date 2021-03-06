class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :value
      t.integer :company_id
      t.integer :customer_id
      # class type needed for STI
      t.string :type

      t.timestamps
    end
  end

  def self.down
  	drop_table :contacts
  end
end
