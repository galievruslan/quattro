class Brand < ActiveRecord::Base
  attr_accessible :model_id, :name
  has_many :models
  belong_to :vehicle
end
