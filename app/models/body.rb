class Body < ActiveRecord::Base
  attr_accessible :name
  belongs_to :vehicle
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
