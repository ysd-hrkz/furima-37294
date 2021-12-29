## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name         | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birth_day          | date       | null: false                    |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル
| Column                 | Type          | Options                        |
| ---------------------- | ------------- | ------------------------------ |
| name                   | string        | null: false                    |
| item_price             | integer       | null: false                    |
| item_description       | text          | null: false                    |
| item_condition_id      | integer       | null: false                    |
| item_category_id       | integer       | null: false                    |
| shipping_area_id       | integer       | null: false                    |
| shipping_fee_id        | integer       | null: false                    |
| shipping_days_id       | integer       | null: false                    |
| user                   | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_one :shipping

## purchasesテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## shippingsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_num           | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :item

