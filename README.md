## usersテーブル
| columm            | type      | options
| ------------------| --------- | ---------
| nickname          | string    | null: false
| email             | string    | null: false, unique:true
| encrypted_pa​​ssword| string    | null: false
| firstname_kanji   | string    | null: false
| lastname_kanji    | string    | null: false
| firstname_kana    | string    | null: false
| lastname_kana     | string    | null: false
| birth_date        | date      | null: false


## Association
  has_many :items
  has_many :orders


## itemsテーブル

| columm               | type       | options
| -------------------  | ---------  | ---------
| name                 | string     | null: false
| content              | text       | null: false
| price                | integer    | null: false
| user                 | references | null: false,foreign_key: true
| category_id          | integer    | null: false
| condition_id         | integer    | null: false
| shipping_fee_payer_id| integer    | null: false
| prefecture_id        | integer    | null: false
| schedule_delivery_id | integer    | null: false            

## Association
  has_one : order
  belongs_to :user


## deliveriesテーブル
| columm              | type       | options
| ------------------- | ---------  | ---------
| postal_code         | string     | null: false
| prefecture_id       | integer    | null: false
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
