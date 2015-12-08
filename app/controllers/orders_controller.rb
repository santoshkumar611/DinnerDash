class OrdersController < ApplicationController

 def order_items_index
  @order_items = current_order.item_orders
 end

 def orders_index
 end
 
 def create_order
   @order = current_order
   @order.save
   @order.item_orders.create(quantity: 1,item_id: params[:id])
   session[:order_id] = @order.id
   @count = @order.item_orders.count
 end

end
