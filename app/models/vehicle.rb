class Vehicle < ActiveRecord::Base
  attr_accessible :body_id, :brand_id, :model_id, :year
  has_many :brands, :models, :bodys
  belong_to :project, :actionregistration
  validates :year, :presence => true
  validates :body_id, :presence => true
  validates :brand_id, :presence => true
  validates :model_id, :presence => true
end
