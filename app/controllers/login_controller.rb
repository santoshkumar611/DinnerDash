class LoginController < ApplicationController
 def logincheck
   user = User.find_by_email(params[:username]) 
   unless user
      user = User.find_by_full_name(params[:username])
   end 
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:notice] = "login success retry"
    redirect_to root_path
   else 
   	flash[:notice] = "login failed retry"
   	render "login"
   end
  end 
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end
end
