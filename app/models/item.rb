class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping
  belongs_to_active_hash :ship_pla
  belongs_to_active_hash :ship_day
  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :name, :text, :image, :price, presence: true
  validates :category_id, :condition_id, :shipping_id, :ship_pla_id, :ship_day_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true , greater_than: 299 ,less_than: 10000000 }
  validates :text, length: { maximum: 1000 }
  validates :name, length: { maximum: 41 }

end
