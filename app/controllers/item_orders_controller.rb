class ItemOrdersController < ApplicationController
 def create
 	  # raise params.inspect
    @order = current_order
    @item_order = @order.item_orders.new(item_order_params)
    @order.save
    session[:order_id] = @order.id
    @count = @order.item_orders.count
  end

  def update
  	 
    @order = current_order
    @item_order = @order.item_orders.find(params[:id])
    @item_order.update_attributes(update_item_order_params)
    @item_orders = @order.item_orders

  end

  def destroy
    @order = current_order
    @item_order = @order.item_orders.find(params[:id])
    @item_order.destroy
    @item_orders = @order.item_orders
    @count = @order.item_orders.count
  end
private
  def item_order_params
    params.require(:item_order).permit(:item_id,:price,:quantity)
  end
  def update_item_order_params
    params.require(:item_order).permit(:quantity)
  end
end
