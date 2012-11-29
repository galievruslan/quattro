class Customer < ActiveRecord::Base
  attr_accessible :name
  has_many :contacts
  has_many :action_registrations
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
