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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| birthday   | string | null: false |
| first_name | string | null: false |
| last_name  | string | null: false |

## items

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| image   | string  | null: false |
| text    | string  | null: false |
| price   | integer | null: false |
| user_id | string  | null: false |

## order

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| item_id | string | null: false |
| user_id | string | null: false |
| buyer   | string | null: false |
| address | string | null: false |
