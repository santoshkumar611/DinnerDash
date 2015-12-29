class LoginController < ApplicationController
  def login
     for_flash
     session[:user_id] = nil
  end
 def logincheck
   user = User.find_by_email(params[:username]) 
   unless user
      user = User.find_by_full_name(params[:username])
   end 
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     if user.is_admin
      redirect_to items_path # need to modify
     else
      if flash[:notice]
       redirect_to new_transaction_path
      else
       reset_cart
       redirect_to items_path
      end
     end
   else 
    for_flash
   	render "login"
   end
  end 
  def logout
    if current_order.item_orders.count >0
      current_order.update(is_missed: true)
      current_user.orders << current_order
    end
    reset_session
    redirect_to root_path
  end
  private 
   def for_flash
    if flash[:notice]
     flash[:notice] = "login" 
    end 
   end
   def reset_cart
    if session[:order_id]
     if prev_order
      prev_order.item_orders.each do |item_order|
       item_order.update(order_id: session[:order_id])
      end
     end
    else
     session[:order_id] = prev_order.id if prev_order
    end
   end
   def prev_order
    current_user.orders.find_by_is_missed(true)
   end
end
