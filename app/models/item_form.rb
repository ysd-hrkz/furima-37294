class ItemForm
  include ActiveModel::Model

  attr_accessor(
     :image, :name, :description, :category_id, :condition_id,
     :shipping_fee_id, :shipping_area_id, :shipping_days_id, :price, :user_id,
     :id, :created_at, :updated_at, :tag_name
  )

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1 , message: 'は、「---」以外を選択してください' }do
    validates :condition_id
    validates :category_id
    validates :shipping_area_id
    validates :shipping_fee_id
    validates :shipping_days_id
  end

  def save
    item = Item.create(image: image, name: name, description: description, 
       category_id: category_id, condition_id: condition_id, shipping_area_id: shipping_area_id,
       shipping_fee_id: shipping_fee_id, shipping_days_id: shipping_days_id, price: price, user_id: user_id
    )
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    item.item_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end
