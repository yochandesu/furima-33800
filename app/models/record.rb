class Record < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :haisou

  
end
