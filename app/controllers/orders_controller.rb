class OrdersController < ApplicationController

 def order_items_index
  @order_items = current_order.item_orders
  @cart_items = []
  @order_items.each do |order_item|
   @cart_items << {id: order_item.id, item: Item.where(:id => order_item.item_id).pluck(:image,:name).first,price: order_item.price,quantity: order_item.quantity}
  end
 end

 def orders_index
 end
 
 def create_order
   @order = current_order
   @order.save
   @order.item_orders.create(quantity: 1,item_id: params[:id],price: Item.find(params[:id]).price)
   session[:order_id] = @order.id
   @count = @order.item_orders.count
 end

end
