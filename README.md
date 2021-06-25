## users
|Column     |Type      |Options    |
|nickname   |string    |null: false|
|email      |string    |null: false, unique: true|
|encrypted_password|bigint|null: false|
|familyname |string    |null: false|
|firstname  |string    |null: false|
|family-kana|string    |null: false|
|first-kana |string    |null: false|
|birthday   |date      |null: false|

### Association
has_many :items
has_many :records

----------------------------------
## items
|Column   |Type      |Options    |
|item_name|string    |null: false|
|description|string  |null: false|
|price    |integer   |null: false|
|exhibitor|references|users_id, foreign_key: true|
|category |string    |null: false|
|status   |string    |null: false|
|delibery |string    |null: false|
|area     |string    |null: false|
|guideline|string    |null: false|

### Association
has_one :record
belongs_to :user

----------------------------------
## records
|Column  |Type      |Options                       |
|buy_item|references|items_id, foreign_key: true|
|buy_person|references|users_id, foreign_key: true|
|adress  |string    |null: false|

### Association
belongs_to :item
belongs_to :user

----------------------------------
## sends
|Column      |Type   |Options    |
|postal_code |integer|null: false|
|prefectures |string |null: false|
|municipality|string |null: false|
|address     |string |null: false|
|building    |string |null: false|
|phone       |integer|null: false|


### Association
belongs_to :record