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
end
