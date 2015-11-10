class LoginController < ApplicationController
 def logincheck
   @user = User.find_by_email_and_password(params[:username],params[:password]) or User.find_by_full_name_and_password(params[:username],params[:password])
   if @user.present?
     session[:user_id] = @user.id
    
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
