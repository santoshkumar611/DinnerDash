class ItemsController < ApplicationController
  before_action :auth_admin, only: [:new,:create,:edit,:update,:destroy,:unavailable]
	def index
		@categories = Category.includes(:items).all
	end
  def create
    
    @item = Item.new(item_details)  
    
    # get the file_type that have been uploaded
    #raise params[:item][:image].present?.inspect
    if params[:item][:image].present?
     file_type = params[:item][:image].content_type
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
      file_path = File.join(Rails.root, 'public', 'images', 'item_images', file_name)
        # copy the image from the uploaded one to file_path
      File.open(file_path, 'wb') do |f|
            f.write params[:item][:image].read
      
      end
      @item.image = file_name
       if @item.save
          flash[:notice] = "success fully registered"
          redirect_to items_path
       else
        flash[:notice] = @item.errors.messages
         render "new"
       end   
    else 
      flash[:notice] = "please upload image"
      render "new"
    end 

  end
  def unavailable

    item = Item.find(params[:id])
    if item .is_available
      item.update(is_available: false)
    else
     item.update(is_available: true) 
    end
    redirect_to items_path
  end
  def new
    @item = Item.new
    @categories = Category.all
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_details)
      redirect_to items_path
    else
      render "edit"
    end   
  end


  def destroy
  Item.find(params[:id]).destroy
  redirect_to items_path
 end
  private
  def item_details
   params.require(:item).permit(:name,:description,:price,:category_id)
  end 
end
