class AddCurrentCartToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :current_cart, references: :carts
    #add_foreign_key :users, :carts, column: :current_cart_id
  end
end
