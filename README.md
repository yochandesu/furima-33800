## users
|Column     |Type      |Options    |
|-----------|----------|-----------|
|nickname   |string    |null: false|
|email      |string    |null: false, unique: true|
|encrypted_password|string|null: false|
|familyname |string    |null: false|
|firstname  |string    |null: false|
|family-kana|string    |null: false|
|first-kana |string    |null: false|
|birthday   |date      |null: false|

### Association
has_many :items
has_many :records


## items
|Column   |Type      |Options    |
|---------|----------|-----------|
|item_name|string    |null: false|
|description|text    |null: false|
|price    |integer   |null: false|
|user     |references|users_id, foreign_key: true|
|category_id|integer |null: false|
|status_id   |integer   |null: false|
|delibery_id |integer   |null: false|
|area_id     |integer   |null: false|
|guideline_id|integer   |null: false|

### Association
has_one :record
belongs_to :user


## records
|Column  |Type      |Options                       |
|--------|----------|------------------------------|
|item    |references|null: false, foreign_key: true|
|user    |references|null: false, foreign_key: true|

### Association
belongs_to :item
belongs_to :user
has_one :send


## sends
|Column      |Type   |Options    |
|-------------|-------|-----------|
|postal_code  |string |null: false|
|prefecture_id|integer|null: false|
|municipality |string |null: false|
|address      |string |null: false|
|building     |string |           |
|phone        |string |null: false|
|record       |references|null: false, foreign_key: true|

### Association
belongs_to :record