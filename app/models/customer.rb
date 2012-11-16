class Customer < ActiveRecord::Base
  attr_accessible :name
  belong_to :actionregistration
  validates :name, :presence => true
  					:length   => { :maximum => 250 }
end
