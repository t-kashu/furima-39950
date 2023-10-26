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
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | name       | null: false                    |
| item-sales-status        | name       | null: false                    |
| item-shipping-fee-status | name       | null: false                    |
| item-prefecture          | name       | null: false                    |
| item-scheduled-delivery  | name       | null: false                    |
| item-price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

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
- has_one    :shipping-address

## shipping_addresses テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| postal-code  | string | null: false                    |
| prefecture   | string | null: false,                   |
| city         | string | null: false,                   |
| addresses    | string | null: false,                   |
| building     | string |                                |
| phone-number | string | null: false,                   |

### Association
- belongs_to :order