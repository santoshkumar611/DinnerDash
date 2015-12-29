class AdminsController < ApplicationController
 
 def dashboard
    # need to start
 end
 
 def new
  	@admin = User.new
  	flash[:notice] = ""
  end

  def create
    @admin = User.new(admin_details)  
    # get the file_type that have been uploaded
    @admin.image = params[:user][:image].content_type
    @admin.is_admin = true
    if @admin.save
     file_type = params[:user][:image].content_type
   # check the file type for images
     file_type == 'image/jpeg' || file_type == 'image/jpg' || file_type == 'image/png' || file_type == 'image/gif' || file_type == 'image/bmp'

      # as per the file type give the images name
      case file_type
         when "image/jpeg"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.jpg"
         when "image/png"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
         when "image/gif"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.gif"
         when "image/bmp"
            file_name = "pic_#{Time.now.strftime("%Y%m%d%H%M%S")}.bmp"
      end
        # give the file path for image
      file_path = File.join(Rails.root, 'public', 'images', 'user_images', file_name)
        # copy the image from the uploaded one to file_path
      File.open(file_path, 'wb') do |f|
            f.write params[:user][:image].read
      end
        flash[:notice] = "success fully registered"
        render "new"
    else 
     	flash[:notice] = @admin.errors.messages
      render "new"
    end	

  end
  private
  def admin_details
   params.require(:user).permit(:full_name,:display_name,:email,:password,:password_confirmation)
  end 
  
end