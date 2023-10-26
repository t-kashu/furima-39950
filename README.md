# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last-name          | string | null: false               |
| first-name         | string | null: false               |
| last-name-kana     | string | null: false               |
| first-name-kana    | string | null: false               |
| birth-date         | data   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-name                | string     | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-sales-status        | text       | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-price               | integer    | null: false                    |
| add-tax-price            | integer    | null: false                    |
| profit                   | integer    | null: false                    |
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
- belongs_to :users
- belongs_to :items
- has_one    :shipping-address

## shipping-addresses テーブル

| Column       | Type   | Options                        |
| ------------ | ------ | ------------------------------ |
| postal-code  | string | null: false                    |
| prefecture   | string | null: false, foreign_key: true |
| city         | string | null: false, foreign_key: true |
| addresses    | string | null: false, foreign_key: true |
| building     | string | null: false, foreign_key: true |
| phone-number | string | null: false, foreign_key: true |

### Association
- belongs_to :order