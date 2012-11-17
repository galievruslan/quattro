class Vehicle < ActiveRecord::Base
  attr_accessible :body_id, :model_id, :year
  has_many :brands, :models, :bodys
  belongs_to :project
  belongs_to :actionregistration
  validates :year, :presence => true
  validates :body_id, :presence => true
  validates :model_id, :presence => true
end
