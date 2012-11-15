class Vehicle < ActiveRecord::Base
  attr_accessible :body_id, :brand_id, :model_id, :year
  has_many :brands, :models, :bodys
  belong_to :project, :actionregistration
end
