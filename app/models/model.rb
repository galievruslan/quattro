class Model < ActiveRecord::Base
  attr_accessible :name
  belong_to :brand, :vehicle
end
