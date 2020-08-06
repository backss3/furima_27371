class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :cost
  belongs_to_active_hash :day

  with_options presence: true do |assoc|
    assoc.validates :image
    assoc.validates :name
    assoc.validates :description
    assoc.validates :category_id
    assoc.validates :status_id
    assoc.validates :cost_id
    assoc.validates :prefecture_id
    assoc.validates :day_id
    assoc.validates :price
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
