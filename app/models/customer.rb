class Customer < ActiveRecord::Base
  attr_accessible :name
  belong_to :actionregistration
end
