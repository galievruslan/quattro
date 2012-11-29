class Vehicle < ActiveRecord::Base
  attr_accessible :body_id, :model_id, :year, :model, :body
  belongs_to :model
  belongs_to :body
  has_and_belongs_to_many :projects
  has_many :action_registrations
  validates :year, :presence => true
  validates :body_id, :presence => true
  validates :model_id, :presence => true
end
