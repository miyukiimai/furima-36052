# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true | 
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_reading       | string | null: false               |
| birthday           | string | null: false               |



## items テーブル

| Column            | Type       | Options                  |
| ------            | ------     | ------------             | 
| user              | references | null: false, foreign_key |
| category          | string     | null: false              |
| product_condition | string     | null: false              |
| shipping_cost     | string     | null: false              |
| prefecture        | integer    | null: false              |
| delivery_date     | string     | null: false              |


## buy テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| credit_card_number | string     | null: false  |
| effective_date     | string     | null: false  |
| security_code      | string     | null: false  |

## send テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| postal_code        | string     | null: false  |
| prefecture         | integer    | null: false  |
| city               | string     | null: false  |
| house_number       | string     | null: false  |
| building_number    | string     |              |
| phone_number       | string     | null: false  |