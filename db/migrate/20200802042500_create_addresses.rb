class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.bigint :item_id,          null: false
      t.bigint :user_id,          null: false
      t.integer :postal_cord,        null: false
      t.string  :prefecture_id,        null: false
      t.string  :city,             null: false
      t.string  :house_number,          null: false
      t.string  :building_name
      t.string :phone_number,     null: false
      t.timestamps
    end
  end
end
