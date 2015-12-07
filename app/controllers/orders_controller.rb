class OrdersController < ApplicationController

 def index
 end
 
 def new 
  @order = Order.new

 end

 def create_order
  raise params.inspect
 end

end
