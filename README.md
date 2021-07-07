## users
|Column     |Type      |Options    |
|-----------|----------|-----------|
|nickname   |string    |null: false|
|email      |string    |null: false, unique: true|
|encrypted_password|string|null: false|
|familyname |string    |null: false|
|firstname  |string    |null: false|
|family_kana|string    |null: false|
|first_kana |string    |null: false|
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
|user     |references|foreign_key: true|
|category_id|integer |null: false|
|status_id   |integer   |null: false|
|delibery_id |integer   |null: false|
|area_id     |integer   |null: false|
|guideline_id|integer   |null: false|

### Association
has_one :record
belongs_to :user

<!-- 購入記録 -->
## records
|Column  |Type      |Options          |
|--------|----------|-----------------|
|item    |references|foreign_key: true|
|user    |references|foreign_key: true|

### Association
belongs_to :item
belongs_to :user
has_one :send

<!-- 発送先 -->
## sends>haisou
|Column      |Type   |Options    |
|-------------|-------|-----------|
|postal_code  |string |null: false|
|area_id      |integer|null: false|
|municipality |string |null: false|
|address      |string |null: false|
|building     |string |           |
|phone        |string |null: false|
|record       |references|foreign_key: true|

### Association
belongs_to :record