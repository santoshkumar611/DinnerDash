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
       redirect_to items_path
      end
     end
   else 
    for_flash
   	render "login"
   end
  end 
  def logout
    session[:order_id] = nil
    session[:user_id] = nil
    redirect_to root_path
  end
  private 
   def for_flash
    if flash[:notice]
     flash[:notice] = "login" 
    end 
   end
end
