class Body < ActiveRecord::Base
  attr_accessible :name
  belong_to :vehicle
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
