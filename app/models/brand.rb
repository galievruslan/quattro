class Brand < ActiveRecord::Base
  attr_accessible :model_id, :name
  has_many :models
  belong_to :vehicle
  validates :model_id, :presence => true
  validates :name, :presence => true, :length   => { :maximum => 250 }
end
