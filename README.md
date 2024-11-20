# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## itemテーブル

| Column                | Type       | Options           |
| ------                | ------     | -----------       |
| item_name             | string     | null: false       |
| item_explanation_id   | string     | null: false       |
| item_category_id      | integer    | null: false       |
| item_situation_id     | integer    | null: false       |
| delivery              | integer    | null: false       |
| prefectures           | string     | null: false       |
| day                   | string     | null: false       |
| sales_price           | integer    | null: false       |
| user                  |references  | foreign_key: true |


### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| delivery         | string     | null: false                    |
| mail             | string     | null: false                    |
| prefectures      | string     | null: false                    |
| town             | string     | null: false                    |
| street_address   | string     | null: false                    |
| building         | string     |                                |
| telephone_number | string     | null: false                    |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address
