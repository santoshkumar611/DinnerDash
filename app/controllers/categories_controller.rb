class CategoriesController < ApplicationController
 def index
 	@categories = Category.all
 end
 def new
 	@category = Category.new
 end
 def create 
 	@category = Category.new(name: params[:category][:name])
 	if @category.save
 		redirect_to allcategories_path
 	else
 		flash[:notice] = @category.errors.messages
 	 render "new"
 	end	
 end
 def destroy
  Category.find(params[:id]).destroy
  redirect_to allcategories_path
 end
end
