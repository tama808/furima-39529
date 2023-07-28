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
has_one  : shipping

## items テーブル

| Column                  | Type    | Options     |
| ----------------------- | ------  | ----------- |
| product                 | string  | null: false |
| description             | text    | null: false |
| category_id             | integer | null: false |
| condition_id            | integer | null: false |
| shipping_cost_id        | integer | null: false |
| prefectures_id          | integer | null: false |
| shipping_days_id 　　　  | integer | null: false |
| price             　　　 | integer | null: false |
| FOREIGN KEY user(users) |references| null: false |
### Association
belong_to  : purchases , users


## purchase テーブル

| Column                  | Type     | Options     |
| ----------------------- | ------   | ----------- |
| FOREIGN KEY item(items) |references| null: false |
| FOREIGN KEY user(users) |references| null: false |

### Association
has_one   : users
has_many  : items



## shipping テーブル

| Column             | Type      | Options     |
| ------------------ | ------    | ----------- |
| purchase           | references| null: false |
| prefectures_id     | integer   | null: false |
| city               | string    | null: false |
| address            | string    | null: false |
| tel                | string    | null: false |
| building_name      | string    |             |

### Association
belong_to : users