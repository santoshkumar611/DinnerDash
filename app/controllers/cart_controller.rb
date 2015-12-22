class CartController < ApplicationController
 
 def index
 	@item_orders =  current_order.item_orders
 	if @item_orders.count > 0
 	 @sum = ItemOrder.find_by_sql(
 		"SELECT SUM(price) AS price FROM item_orders where item_orders.order_id = #{current_order.id}")[0].price 
  end
 end
 def clear_cart
 	 session[:order_id] = nil
 end
end
