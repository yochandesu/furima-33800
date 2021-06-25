## users
|Column  |Type      |Options                       |
|nickname|references|null: false, foreign_key: true|
|email   |references|null: false, foreign_key: true|
|password|references|null: false, foreign_key: true|
|name    |references|null: false, foreign_key: true|
|birthday|references|null: false, foreign_key: true|

### Association
has_many :items
has_many :items


## items
|Column  |Type      |Options                       |
|seller  |references|null: false, foreign_key: true|
|category|references|null: false, foreign_key: true|
|status  |references|null: false, foreign_key: true|
|delibery|references|null: false, foreign_key: true|
|area    |references|null: false, foreign_key: true|
|guideline|references|null: false, foreign_key: true|

### Association
has_one :records
belongs_to :users


## records
|Column  |Type      |Options                       |
|buy_item|references|null: false, foreign_key: true|

### Association
belongs_to :items
belongs_to :users
