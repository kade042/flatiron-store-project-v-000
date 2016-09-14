class LineItemsController < ApplicationController

  def create
    #binding.pry
    if current_user.current_cart.nil?
      current_user.current_cart = current_user.carts.create
      current_user.save
    end
    @item = Item.find_by(id: params[:item_id])
    if @item.line_items.empty?
      @item.line_items.create(quantity: 1, cart: current_user.current_cart)
      redirect_to cart_path(current_user.current_cart)
    else
      @item.line_items.each do |li|
        if li.item.id == @item.id
          quantity = li.quantity + 1
          li.update(quantity: quantity, cart: current_user.current_cart)
          li.item_id = @item.id
          redirect_to cart_path(current_user.current_cart)
        else
          @item.line_items.create(quantity: 1, cart: current_user.current_cart)
          redirect_to cart_path(current_user.current_cart)
        end

      end

    end

  end




end
