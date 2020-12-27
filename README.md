# テーブル設計

## users テーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | unique: true |
| encrypted_password | string  | null: false  |
| family_name        | string  | null: false  |
| first_name         | string  | null: false  |
| family_name_kana   | string  | null: false  |
| first_name_kana    | string  | null: false  |
| birth_date         | date    | null: false  |

## Association
- has_many :items
- has_many :order


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| cost_id          | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| delivery_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key :true |

## Association

- belongs_to :user
- has_one    :order


## destinations テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| postcode      | string      | null: false                    |
| prefecture_id | integer     | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      | null: false                    |
| order         | references  | null: false, foreign_key :true |


## Association

- belongs_to :order


## orders テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| user        | references | null: false, foreign_key :true  |
| item        | references | null: false, foreign_key :true  |


## Association

- belongs_to :user
- has_one    :destination
- belongs_to :item