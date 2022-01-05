class Shipping_days < ActiveHash::Base
  self.data = [
    { id: 1, name: '---'},
    { id: 2, name: '3日で発送'},
    { id: 3, name: '4〜7日で発送'},
    { id: 4, name: '目立った傷や汚れなし'}
  ]

  include ActiveHash::Associations
  has_many :items
end