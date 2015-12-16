class CartController < ApplicationController
 
 def index
 	@item_orders =  current_order.item_orders
 	@sum = ItemOrder.find_by_sql(
 		"SELECT SUM(price) AS price FROM item_orders where item_orders.order_id = #{current_order.id}")[0].price 
 end
 def clear_cart
  session[:order_id] = nil
 end
end
