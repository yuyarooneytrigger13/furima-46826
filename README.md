## usersテーブル
| columm            | type      | options
| ------------------| --------- | ---------
| nickname          | string    | null: false
| email             | string    | null: false
| password          | string    | null: false
| firstname_kanji   | string    | null: false
| lastname_kanji    | string    | null: false
| firstname_kana    | string    | null: false
| lastname_kana     | string    | null: false
| birth_date        | date      | null: false


## Association
  has_many :items
  has_many :orders


## itemsテーブル

| columm              | type       | options
| ------------------- | ---------  | ---------
| name                | string     | null: false
| content             | text       | null: false
| price               | integer    | null: false
| user                | references | null: false,foreign_key: true

## Association
  has_one : order
  belongs_to :user


## deliveriesテーブル
| columm              | type       | options
| ------------------- | ---------  | ---------
| postal_code         | integer    | null: false
| city                | string     | null: false
| address             | string     | null: false
| building            | string     |
| phone               | string     | null: false
| order               | references | null: false,foreign_key: true

## Association
  belongs_to :order


## ordersテーブル
| columm              | type       | options
| ------------------- | ---------- | ---------
| item                | references | null: false,foreign_key: true
| user                | references | null: false,foreign_key: true


## Association
  belongs_to :item
  belongs_to :user
  has_one :delivery
