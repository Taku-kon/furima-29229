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
has_many:orders

## items

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| name      | string     | null: false |
| text      | text       | null: false |
| price     | integer    | null: false |
| user      | references | null: false foreign_key: true|
| shipping  | integer    | null: false |
| ship_pla  | integer    | null: false |
| ship_day  | integer    | null: false |
| condition | integer    | null: false |
| favorite  | integer    | null: false |
| report    | integer    | null: false |


has_one:order
belongs_to:user

## orders

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| item   | references | null: false foreign_key: true |
| user   | references | null: false foreign_key: true |

belongs_to:item
belongs_to:user
has_one:address

## addresses

| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| postal_code   | string    | null: false |
| prefecture    | integer   | null: false |
| city          | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| phone_num     | string    | null: false uniqueness: true |
| order         | reference | null: false foreign_key: true |

belongs_to:order
