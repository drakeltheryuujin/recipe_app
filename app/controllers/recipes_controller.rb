class RecipesController < ApplicationController

	def show
		@recipe = Recipe.find(params[:id])
		@bookmark = Bookmark.new
		@user = current_user
	end

end
