class LineItemsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    cart = current_user.current_cart || current_user.carts.create
    cart.add_item(item.id)
    if cart.save
      redirect_to cart_path(cart)
    else
      redirect_to store_path
    end
  end

end
