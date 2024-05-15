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

## user テーブル
| column           | type         | options                  |
|------------------|--------------|--------------------------|
| user_id          | integer      | null: false              |
| nickname         | string       | null: false              |
| email            | string       | null: false              |
| password         | string       | null: false unique: true |
| first_name       | string       | null: false              |
| second_name      | string       | null: false              |
| first_name_kana  | string       | null: false              |
| second_name_kana | string       | null: false              |
| birthday         | date         | null: false              |

has_many :products
has_many :history
has_many :address

## product テーブル
| column           | type          | options      |
|------------------|---------------|--------------|
| user_id          | integer       | null: false  |
| product_name     | string        | null: false  |
| description      | text          | null: false  |
| category_id      | integer       | null: false  |
| condition_id     | integer       | null: false  |
| shipping_cost_id | integer       | null: false  |
| shipping_area_id | integer       | null: false  |
| shipping_days_id | integer       | null: false  |
| price            | integer       | null: false  |

belongs_to :user
has_one :history

## address テーブル
| column             | type      | options                |
|--------------------|-----------|------------------------|
| postal_code        | string    | null: false            |
| prefecture         | string    | null: false            |
| city               | string    | null: false            |
| street_address     | string    | null: false            |
| building_name      | string    | null: false            |
| phone_number       | integer   | null: false            |

belongs_to :user

## history テーブル
| column            | type      | options                |
|-------------------|-----------|------------------------|
| product           | string    | null: false            |
| user_id           | string    | null: false            |

belongs_to :user
belongs_to :product