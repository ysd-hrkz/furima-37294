class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  has_one_attached :image

  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_fee
  belongs_to :shipping_days

  has_many :item_tag_relations
  has_many :tags, through: :item_tag_relations , dependent: :destroy
end
