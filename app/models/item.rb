class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :category
belongs_to :status
belongs_to :delibery
belongs_to :area
belongs_to :guideline

has_one :record
belongs_to :user
has_one_attached :image

with_options presence: true do
  validates :image
  validates :item_name
  validates :description
  validates :user
  validates :category_id
  validates :status_id
  validates :delibery_id
  validates :area_id
  validates :guideline_id
  end

 with_options presence: true, format: { with: /\A[0-9]+\z/}, length: { in: 3..7 }  do
 validates :price
end

validates :category_id, numericality: { other_than: 1 }
validates :status_id, numericality: { other_than: 1 }
validates :delibery_id, numericality: { other_than: 1 }
validates :area_id, numericality: { other_than: 1 }
validates :guideline_id, numericality: { other_than: 1 }
end