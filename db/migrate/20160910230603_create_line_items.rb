class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 1
      t.references :item, index: true
      t.references :cart, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :items
    add_foreign_key :line_items, :carts
  end
end
