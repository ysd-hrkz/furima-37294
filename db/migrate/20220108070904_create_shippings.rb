class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :post_code       , null: false
      t.integer    :shipping_area_id, null: false
      t.string     :city            , null: false
      t.string     :address         , null: false
      t.string     :building_name
      t.string     :phone_num       , null: false
      t.references :order           , null: false, foreign_key: true
      t.timestamps
    end
  end
end
