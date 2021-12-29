## usersテーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| name     | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association
- has_many :items
- has_one :profiles
- has_one :purchases

## profilesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| family_name      | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birth_day        | date       | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## itemsテーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| image            | string  | null: false |
| name             | string  | null: false |
| item_price       | integer | null: false |
| item_description | string  | null: false |
| item_condition   | string  | null: false |
| item_category    | string  | null: false |
| shipping_area    | string  | null: false |
| shipping_fee     | string  | null: false |
| shipping_days    | string  | null: false |

### Association
- belongs_to :user

## purchasesテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user