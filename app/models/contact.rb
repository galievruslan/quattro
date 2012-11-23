class Contact < ActiveRecord::Base
  attr_accessible :value
  belongs_to :company
end
