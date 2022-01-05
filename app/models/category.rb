class Category < ActiveHash::Base
  has_many :items
end