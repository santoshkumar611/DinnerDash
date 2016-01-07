class CartController < ApplicationController
 
 def index
 	@item_orders =  current_order.item_orders
 	if @item_orders.count > 0
 	 @sum = sum(current_order.id)
  end
 end
 def clear_cart
 	 session[:order_id] = nil
 end

 def add_to_cart
 raise params.inspect
 end
 def discard
  raise params.inspect
 end
end
