class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :image,       null: false
      t.string :name,        null: false
      t.text :description,       null: false
      t.references :category_id, null: false
      t.references :status,      null: false
      t.integer :cost,           null: false
      t.integer :prefecture_id,  null: false
      t.integer :day,            null: false
      t.integer :price,          null: false
      t.timestamps
    end
  end
end
