class ShoppingListsController < ApplicationController
	# def new
	# end

	# def create
	# end

	# def edit
	# 	byebug
	# 	@user.shopping_list.add_line_item(LineItem.create(ingredient_id: ingredient.id, shopping_list_id: @user.shopping_list.id))
	# end

	def index
		@shopping_lists = ShoppingList.all
	end

	def show
		@shopping_list = ShoppingList.find(current_user.shopping_list.id)
	end

	def edit 
		@shopping_list = ShoppingList.find(params[:id])
		@shopping_list_uniq = ShoppingList.new 
		@shopping_list.distinct_ingredients.to_a.each do |ing|
			@shopping_list_uniq.ingredients << ing
		end  
	end

	def update
		  @shopping_list = ShoppingList.find(params[:id])
		  @shopping_list.remove_selected_items(params[:shopping_list][:ingredients])
		  @shopping_list.add_selected_items(params[:shopping_list][:line_items])
		  @shopping_list.save
     redirect_to shopping_list_path @shopping_list
	end

	def delete_all
		@shopping_list = ShoppingList.find_by(user_id: session[:user_id])
		@shopping_list.remove_all_items
		redirect_to shopping_list_path @shopping_list
	end


private 


	# def shopping_list_params  
	#   params.require(:shopping_list).permit(:ingredients=>[])
	# end
end
