class Company < ActiveRecord::Base
  attr_accessible :description
  has_many :contacts
end
