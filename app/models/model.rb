class Model < ActiveRecord::Base
  attr_accessible :name
  belong_to :brand, :vehicle
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
