class Brand < ActiveRecord::Base
  attr_accessible :name
  has_many :models
  belongs_to :vehicle
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
