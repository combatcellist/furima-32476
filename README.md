# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| user_password      | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

## Association
- has_many :items
- has_one  :credit_card
- has_one  :description

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category    | string     | null: false                   |
| condition   | string     | null: false                   |
| cost        | integer    | null: false                   |
| prefecture  | string     | null: false                   |
| date        | integer    | null: false                   |
| user        | references | null: false, foreign_key :true|

## Association

- belongs_to :user

## credit_cards テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| customer_id | integer    | null: false                    |
| card_id     | integer    | null: false                    |
| user        | refernces  | null: false, foreign_key :true |

## Association

- belongs_to :user

## destination テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user          | refernces  | null: false, foreign_key :true | 

## Association

- belongs_to :user