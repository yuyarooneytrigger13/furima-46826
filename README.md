## usersテーブル
| columm            | type      | options
| ------------------| --------- | ---------
| nickname          | string    | null: false
| email             | string    | null: false
| password          | string    | null: false
| firstnmame_kanji  | string    | null: false
| lastname_kanji    | string    | null: false
| firstname_kana    | string    | null: false
| lastname_kana     | string    | null: false
| birth_month       | date      | null: false
| birth_day         | date      | null: false

## Association
  has_many :items
  has_many :orders


## itemsテーブル

| columm              | type       | options
| ------------------- | ---------  | ---------
| name                | text       | null: false
| content             | text       | null: false
| price               | integer    | null: false
| user                | references | null: false,foreign_key: true

## Association
  has_one : order
  belong_to :user


## deliveriesテーブル
| columm              | type       | options
| ------------------- | ---------  | ---------
| postal_code         | integer    | null: false
| city                | text       | null: false
| address             | text       | null: false
| building            | text       |
| phone               | integer    | null: false
| user                | references | null: false,foreign_key: true
| item                | references | null: false,foreign_key: true

## Association
  belong_to order


## ordersテーブル
| columm              | type       | options
| ------------------- | ---------- | ---------
| item                | references | null: false,foreign_key: true
| user                | references | null: false,foreign_key: true


## Association
  belong_to :item
  belong_to :user
  has_one :deliveries
