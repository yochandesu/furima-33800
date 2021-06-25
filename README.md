## users
|Column  |Type      |Options                       |
|nickname|string    |null: false, foreign_key: true|
|email   |string    |null: false, foreign_key: true, unique: true|
|encrypted_password|integer   |null: false, foreign_key: true|
|familyname |string    |null: false, foreign_key: true|
|firstname  |string    |null: false, foreign_key: true|
|family-kana|string    |null: false, foreign_key: true|
|first-kana |string    |null: false, foreign_key: true|
|birthday   |date      |null: false, foreign_key: true|

### Association
has_many :items
has_many :records


## items
|Column  |Type      |Options                       |
|price   |integer    |null: false, foreign_key: true|
|seller  |references|users_id, foreign_key: true   |
|category|string    |null: false, foreign_key: true|
|status  |string    |null: false, foreign_key: true|
|delibery|string    |null: false, foreign_key: true|
|area    |string    |null: false, foreign_key: true|
|guideline|string    |null: false, foreign_key: true|

### Association
has_one :record
belongs_to :user


## records
|Column  |Type      |Options                       |
|buy_item|references|items_id, foreign_key: true|
|buy_person|references|users_id, foreign_key: true|
|adress  |string    |null: false, foreign_key: true|


### Association
belongs_to :item
belongs_to :user
