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
- has_many :orders
- has_many :comments

## itemsテーブル
| Column            | Type          | Options                        |
| ----------------- | ------------- | ------------------------------ |
| name              | string        | null: false                    |
| price             | integer       | null: false                    |
| description       | text          | null: false                    |
| condition_id      | integer       | null: false                    |
| category_id       | integer       | null: false                    |
| shipping_area_id  | integer       | null: false                    |
| shipping_fee_id   | integer       | null: false                    |
| shipping_days_id  | integer       | null: false                    |
| user              | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order
- has_many :item_tag_relations
- has_many :tags, through: :item_tag_relations , dependent: :destroy
- has_many :comments

## ordersテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping


## shippingsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| city                | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_num           | string     | null: false                    |
| order               | references | null: false, foreign_key: true |

### Association
- belongs_to :order

## tagsテーブル
| Column   | Type   | Options                       |
| -------- | ------ | ----------------------------- |
| tag_name | string | null: false, uniqueness: true |

### Association
- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations

## item_tag_relationsテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| item   | references | foreign_key: true |
| tag    | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :tag

## commentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       |                                |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
