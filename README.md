やること
バリデーション
ディレクトリトラバーサル対策
他ユーザーの進捗確認画面実装
Twitterに出力する機能
積み上げ時間、修正機能
イメージ画像とは別にアイコン画像を設定できるようにしてもいい、イメージ画像がいまいちならそっちに統合
テストユーザーでログイン機能はポートフォリオを見せるときにちょっと試してもらうのにいいかも
現在、目標と積み上げ時間が結びついていない  一人が何度か目標を設定し直す状況にならなければ修正は不要
public_flagはランキングに匿名で表示されるようにすればいいか
ページごとの訪問数カウンターを設置したい

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