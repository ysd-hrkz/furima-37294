class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_fee
  belongs_to :shipping_days

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
               format: { with: /\A[0-9]+\z/}
  end

  with_options numericality: { other_than: 1 } do
    validates :condition
    validates :category
    validates :shipping_area
    validates :shipping_fee
    validates :shipping_days
  end
end
