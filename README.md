# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| item_name                   | string     | null: false                    |
| item_info                   | text       | null: false                    |
| item_category_id            | id         | null: false                    |
| item_sales_status_id        | id         | null: false                    |
| item_shipping_fee_status_id | id         | null: false                    |
| item_prefecture_id          | id         | null: false                    |
| item_scheduled_delivery_id  | id         | null: false                    |
| item_price                  | integer    | null: false                    |
| user                        | references | null: false, foreign_key: true |

### Association
- has_many   :users
- has_many   :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column        | Type   | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| item_prefecture_id | id         | null: false,                   |
| city               | string     | null: false,                   |
| addresses          | string     | null: false,                   |
| building           | string     |                                |
| phone_number       | string     | null: false,                   |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :orders