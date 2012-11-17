class Model < ActiveRecord::Base
  attr_accessible :name, :brand_id
  belongs_to :brand
  belongs_to :vehicle
  validates :name, :presence => true, :length   => { :maximum => 250 }
  validates :brand_id, :presence => true
end
