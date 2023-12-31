# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| family_name        | string | null: false |
| first_name         | string | null: false |
| k_family_name      | string | null: false |
| k_first_name       | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false, unique: true|
| birth              | date   | null: false |
| nickname           | string | null: false |

### Association
has_many : items
has_many : purchases


## items テーブル

| Column                  | Type       | Options     |
| ----------------------- | ------     | ----------- |
| product                 | string     | null: false |
| description             | text       | null: false |
| category_id             | integer    | null: false |
| condition_id            | integer    | null: false |
| shipping_cost_id        | integer    | null: false |
| prefecture_id           | integer    | null: false |
| shipping_day_id 　　　  | integer    | null: false |
| price             　　　 | integer    | null: false |
| user                    | references | null: false, foreign_key: true |
### Association
has_one    : purchase
belong_to  : user

## purchases テーブル

| Column                  | Type     | Options     |
| ----------------------- | ------   | ----------- |
| item   | references  | null: false, foreign_key: true |
| user   | references  | null: false, foreign_key: true |

### Association
belong_to  : user
belong_to  : item
has_one    : shipping



## shippings テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| purchase           | references| null: false,foreign_key: true |
| postcode           | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| tel                | string    | null: false |
| building_name      | string    |             |

### Association
belong_to : purchase