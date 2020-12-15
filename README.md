# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

## Association
- has_many :items
- has_one  :description

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| name        | string     | null: false                   |
| description | text       | null: false                   |
| category    | integer    | null: false                   |
| condition   | integer    | null: false                   |
| cost        | integer    | null: false                   |
| prefecture  | integer    | null: false                   |
| date        | integer    | null: false                   |
| user        | references | null: false, foreign_key :true|

## Association

- belongs_to :user

## destination テーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| post_code     | string      | null: false                    |
| prefecture    | string      | null: false                    |
| city          | string      | null: false                    |
| address       | string      | null: false                    |
| building_name | string      |                                |
| phone_number  | string      | null: false                    |
| user          | references  | null: false, foreign_key :true | 

## Association

- belongs_to :user

## deal テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| user_id     | references | null: false, foreign_key :true  |
| item_id     | references | null: false, foreign_key :true  |

## Association

- belongs_to :user
- belongs_to :item