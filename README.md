# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| -----------------  | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false  unique: true |
| encrypted_password | string | null: false,              |               
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_day          | date   | null: false               |



### Association

- has_many :products
- has_many :comments
- has_many :product_users


## products テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     | 
| category_id      | integer    | null: false                     |
| status_id        | integer    | null: false                     |
| delivery_fee_id  | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     | #発送下の地域
| delivery_days_id | integer    | null: false                     |
| price            | integer    | null: false                     |
| description      | text       | null: false                     |
| user             | references | null: false,  foreign_key: true |

### Association

- has_many   :comments
- has_one  :product_user
- belongs_to :user




## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| product   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## buyers テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     | 
| prefecture_id    | integer    | null: false                     | #発送先の地域
| city             | string     | null: false                     |
| numbering        | string     | null: false                     |
| building_name    | string     |                                 | 
| telephone_number | string     | null: false                     |
| product_user     | references | null: false, foreign_key: true  |

### Association

- belongs_to :product_user


## product_users テーブル

| Column  | Type        | Options                        |
| ------- | ----------- | ------------------------------ |
| product | references  | null: false, foreign_key: true |
| user    | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one    :buyer

