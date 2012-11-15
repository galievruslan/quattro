class Body < ActiveRecord::Base
  attr_accessible :name
  belong_to :vehicle
end
