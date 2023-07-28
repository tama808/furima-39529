# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| family name        | string | null: false |
| first name         | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| date of birth      | date   | null: false |
| nickname           | string | null: false |

### Association
has_many : 
has_many : comments

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product            | string | null: false |
| description        | text   | null: false |
| image              | integer| null: false |
| category           | string | null: false |
| condition          | string | null: false |
| seller name        | string | null: false |
| shipping cost      | integer| null: false |
| area               | string | null: false |
| days               | integer| null: false |
| price              | integer| null: false |
| commission         | integer| null: false |
| profit             | integer| null: false |

### Association
has_many : 
has_many : 

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| family name        | string | null: false |
| first name         | string | null: false |
| encrypted_password | string | null: false |
| email              | string | null: false |
| date of birth      | date   | null: false |
| nickname           | string | null: false |

### Association
has_many : 
has_many : comments