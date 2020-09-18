# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users

| Column     | Type     | Options     |
| ---------- | -------- | ----------- |
| nickname   | string   | null: false |
| email      | string   | null: false |
| password   | string   | null: false |
| birthday   | date     | null: false |
| first_name | string   | null: false |
| last_name  | string   | null: false |
| first_kana | string   | null: false |
| last_kana  | string   | null: false |

has_many:items
has_many:order
has_one:address

## items

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| text      | string  | null: false |
| price     | integer | null: false |
| user      | string  | null: false |
| name      | string  | null: false |
| shipping  | string  | null: false |
| ship_pla  | string  | null: false |
| ship_day  | string  | null: false |
| condition | string  | null: false |


has_one:order
belongs_to:user

## order

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| item_id | string | null: false |
| user_id | string | null: false |
| buyer   | string | null: false |
| id      | string | null: false |

belongs_to:item
belongs_to:user

## address

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |

belong_to:user
has_many:order

