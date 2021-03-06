class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   helper_method :current_user , :categories , :current_order_items
  def auth_admin 
   if current_user
    redirect_to root_path if current_user.is_admin == false
   else 
    redirect_to root_path
   end
  end

  def admin
    if current_user
      current_user.is_admin == true
    else
      false
    end
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def categories
    @categories = Category.all
  end
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new(status_id: 1)
    end
  end
  
  def current_order_items
    if !session[:order_id].nil?
      count = Order.find(session[:order_id]).item_orders.count
    else
      count = 0
    end
  end

  def sum(id)
      @sum = ItemOrder.find_by_sql("
        SELECT SUM(price) AS price FROM item_orders where item_orders.order_id = #{id}")[0].price
    end
end
