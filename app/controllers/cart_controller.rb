class CartController < ApplicationController
 
 def index
 	@item_orders =  current_order.item_orders  
 end

end
