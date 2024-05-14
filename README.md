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
| column         | type         | options                  |
|----------------|--------------|--------------------------|
| UserID(PK)     | integer      | null: false              |
| Nickname       | string       | null: false              |
| Email          | string       | null: false              |
| Password       | string       | null: false              |
| FirstName      | string       | null: false unique: true |
| SecondName     | string       | null: false              |
| FirstNameKana  | string       | null: false              |
| SecondNameKana | string       | null: false              |
| BirthYear      | date         | null: false              |
| BirthMonth     | date         | null: false              |
| BirthDay       | date         | null: false              |

has_many :products, foreign_key: 'SellerID'
has_many :transactions, foreign_key: 'BuyerID'

## product テーブル
| column        | type          | options      |
|---------------|---------------|--------------|
| ProductID(PK) | integer       | null: false  |
| Image         | text          | null: false  |
| ProductName   | string        | null: false  |
| Description   | text          | null: false  |
| Category      | string        | null: false  |
| Condition     | string        | null: false  |
| ShippingArea  | string        | null: false  |
| ShippingDays  | string        | null: false  |
| Price         | integer       | null: false  |
| SellerID(FK)  | integer       | null: false  |


belongs_to :user, foreign_key: 'SellerID'
has_one :transaction

## transaction テーブル
| column            | type      | options                |
|-------------------|-----------|------------------------|
| TransactionID(PK) | integer   | null: false            |
| ProductID(FK)     | integer   | null: false            |
| BuyerID(FK)       | integer   | null: false            |
| PostalCode        | string    | null: false            |
| Prefecture        | string    | null: false            |
| City              | string    | null: false            |
| StreetAddress     | string    | null: false            |
| BuildingName      | string    |                        |
| PhoneNumber       | integer   | null: false            |

belongs_to :product
belongs_to :user, foreign_key: 'BuyerID'