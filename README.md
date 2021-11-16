# README

## users テーブル

| Column                 | Type   | Options                   |
| ------------------     | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true | 
| encrypted_password     | string | null: false               |
| last_name              | string | null: false               |
| first_name             | string | null: false               |
| last_name_kana         | string | null: false               |
| first_name_kana        | string | null: false               |
| birth_year             | date   | null: false               |
| birth_month            | date   | null: false               |
| birth_day              | date   | null: false               |

## items テーブル

| Column               | Type       | Options                  |
| ------               | ------     | ------------             | 
| item_image           | string     | null: false              |
| item_name            | string     | null: false              |
| item_description     | text       | null: false              |
| category_id          | integer    | null: false              |
| product_condition_id | integer    | null: false              |
| shipping_cost_id     | integer    | null: false              |
| prefecture_id        | integer    | null: false              |
| delivery_date_id     | integer    | null: false              |
| price                | string     | null: false              |
| commission           | string     |                          |
| profit               | string     |                          |
| user_id              | string     | null: false              |
| buy_id               | string     | null: false              |


## buys テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------                   |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

## sends テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| postal_code        | string     | null: false  |
| prefecture_id      | integer    | null: false  |
| city               | string     | null: false  |
| house_number       | string     | null: false  |
| building_number    | string     |              |
| phone_number       | string     | null: false  |
| buy_id             | string     | null: false  |
