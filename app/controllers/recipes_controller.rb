class RecipesController < ApplicationController

	def show
		binding.pry
		@recipe = Recipe.find(params[:id])
	end

end
