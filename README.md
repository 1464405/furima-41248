# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## itemテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name   | string | null: false |
| item_explanation   | string | null: false |
| item_detail   | string | null: false |
| item_category   | string | null: false |
| item_situation   | string | null: false |
| item_detail   | string | null: false |
| delivery   | string | null: false |
| delivery_load   | string | null: false |
| region  | string | null: false |
| day   | string | null: false |
| sales_price   | string | null: false |

### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| delivery | string  | null: false                     |
| mail | string  | null: false                         |
| prefectures | string  | null: false                  |
| town | string  | null: false                         |
| street_address | string  | null: false               |
| building | string  | null: false                     |
| telephone_number | string  | null: false             |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
