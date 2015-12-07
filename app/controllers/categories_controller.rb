class CategoriesController < ApplicationController
 def index
 	@categories = Category.all
 end
 def new
 	@category = Category.new
 end
 
 def show
  @category = Category.includes(:items).find(params[:id])
 end

 def create 
 	@category = Category.new(name: params[:category][:name])
 	if @category.save
 		redirect_to allcategories_path
 	else
 		@categories = Category.all
 	 render "index"
 	end	
 end
 def destroy
  Category.find(params[:id]).destroy
  redirect_to allcategories_path
 end
end
