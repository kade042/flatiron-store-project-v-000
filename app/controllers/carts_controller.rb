class CartsController < ApplicationController

  def show
    @cart = Cart.find_by(id: params[:id])
  end

  def update
    @cart = Cart.find_by(id: params[:cart][:id])
    @cart.line_items.each do |li|
      inventory = li.item.inventory - li.quantity
      li.item.update(
        title: li.item.title,
        inventory: inventory,
        price: li.item.price,
        category_id: li.item.category_id
      )

    end
    @cart.items = []
    @cart.line_items = []

    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path

  end

end
