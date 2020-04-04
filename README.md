https://gyazo.com/26c5904bac1cb478ce2559b9de1020ee


# You will be...? DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|password|string|null: false|
|week_time|float|null: false|
|image|string|-|
|public_flag|integer|null: false|
|goal_id|integer|null: false, foreign_key|

### Association
- belongs_to :goal
- has_many :times

## y_timesテーブル
|Column|Type|Options|
|------|----|-------|
|time|float|null: false|
|note|string|-|
|user_id|integer|null: false, foreign_key|
|goal_id|integer|null: false, foreign_key|

### Association
- belongs_to :goal
- belongs_to :user

## goalsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|time|integer|null: false|

### Association
- has_many :goals
- has_many :users
