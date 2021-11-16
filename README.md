# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false               | 
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| name_reading       | string | null: false               |
| birthday           | text   | null: false               |



## items テーブル

| Column            | Type       | Options      |
| ------            | ------     | ------------ | 
| user              |            | null: false
| category          | string     | null: false  |
| product_condition | text       | null: false  |
| shipping_cost     | text       | null: false  |
| prefecture        | integer    | null: false  |
| delivery_date     |            | null: false  |


## buy テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| credit_card_number | text       | null: false  |
| effective_date     | references | null: false  |
| security_code      | references | null: false  |

## send テーブル

| Column             | Type       | Options      |
| ------             | ---------- | ------------ |
| postal_code        | string     | null: false  |
| prefecture         | integer    | null: false  |
| city               | string     | null: false  |
| house_number       | string     | null: false  |
| building_number    | string     |              |
| phone_number       | string     | null: false  |