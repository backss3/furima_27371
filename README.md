# Furima-27371 DB

## users_table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kane|string|null: false|
|birthday|integer|null: false|

### Association
- has_many :items
- has_many :comments
- belongs_to :address
- has_many :deal_items


## items_table
|Column|Type|Options|
|------|----|-------|
|image|references|null: false|
|name|string|null: false|
|description|text|null: false|
|category_id|references|null: false|
|status|references|null: false|
|cost|integer|null: false|
|prefecture_id|integer|null: false|
|day|integer|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :comments
- belongs_to :deal_item

## deal_item_table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## address_table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|post_cord|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|
|phone_number|integer|null: false|

### Association
- belongs_to :user

## comments_table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|comments|text|

### Association
- belongs_to :user
- belongs_to :item

