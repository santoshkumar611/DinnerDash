class ItemOrdersController < ApplicationController
 
 def create
    @order = current_order
    if @order.item_orders.count > 0 
      
     if @order.item_orders.pluck(:item_id).include? params[:item_order][:item_id].to_i
       item_order =  @order.item_orders.find_by_item_id(params[:item_order][:item_id])
       item_order.update(quantity: item_order.quantity+1,
                         price: Item.find(params[:item_order][:item_id]).price*(item_order.quantity+1))
       @count = @order.item_orders.count
     else
      @item_order = @order.item_orders.new(item_order_params)
      @order.save
      session[:order_id] = @order.id
      @count = @order.item_orders.count
     end 
    else  
     @item_order = @order.item_orders.new(item_order_params)
     @order.save
     session[:order_id] = @order.id
     @count = @order.item_orders.count
    end
  end

  def update 
    @order = current_order
    @item_order = @order.item_orders.find(params[:id])
    @item_order.update_attributes(update_item_order_params)
    @item_order.update(price: Item.find(params[:item_order][:item_id]).price*params[:item_order][:quantity].to_i)
    @item_orders = @order.item_orders
    @sum = sum(current_order.id)
  end

  def destroy
    @order = current_order
    @item_order = @order.item_orders.find(params[:id])
    @item_order.destroy
    @item_orders = @order.item_orders
    @count = @order.item_orders.count
    @sum = sum(current_order.id)
  end
private
  def item_order_params
    params.require(:item_order).permit(:item_id,:price,:quantity)
  end
  def update_item_order_params
    params.require(:item_order).permit(:quantity)
  end
end
