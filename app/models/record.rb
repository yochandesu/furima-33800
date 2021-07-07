class Record < ApplicationRecord
  # attr_accessor :token
  belongs_to :item
  belongs_to :user
  has_one :haisou

  
end
