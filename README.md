# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| family_name        | string | null: false |
| first_name         | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| birth              | date   | null: false |
| nickname           | string | null: false |

### Association
has_one  : shipping
has_many : items , purchases

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product            | string | null: false |
| description        | text   | null: false |
| image              | integer| null: false |
| category           | string | null: false |
| condition          | string | null: false |
| seller_name        | string | null: false |
| shipping_cost      | integer| null: false |
| shipping_area      | string | null: false |
| shipping_days      | integer| null: false |
| price              | integer| null: false |
| commission         | integer| null: false |
| profit             | integer| null: false |
| product_id         | integer| null: false |

### Association
belong_to  : purchases , users

## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchases_id       | integer| null: false |
| product_id         | integer| null: false |
| date               | date   | null: false |


### Association
has_one   : shipping
has_many  : items
belong_to : users

## shipping テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchases_id       | integer| null: false |
| postcode           | integer| null: false |
| prefectures        | date   | null: false |
| city               | integer| null: false |
| address            | integer| null: false |
| tel                | date   | null: false |
| building_name      | integer| null: false |

### Association
has_one   : users
belong_to : purchases