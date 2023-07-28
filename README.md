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
has_one  : shipping
has_many : items , purchases

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| product            | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_cost_id   | integer | null: false |
| shipping_area_id   | integer | null: false |
| shipping_days_id   | integer | null: false |
| price              | integer | null: false |
| product_id         | integer | null: false |

### Association
belong_to  : purchases , users

## purchase テーブル

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| purchase     　　　 |references| null: false |

### Association
has_one   : shipping
has_many  : items
belong_to : users

## shipping テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchase           | integer| null: false |
| user               | integer| null: false |
| prefectures_id     | integer| null: false |
| city               | string | null: false |
| address            | string | null: false |
| tel                | string | null: false |
| building_name      | string |             |

### Association
has_one   : users
belong_to : purchases