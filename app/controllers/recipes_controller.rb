class RecipesController < ApplicationController

<<<<<<< a786e09095e513d5bdc0fe7519ab68f8e163213d
  def index
    @recipes = Recipe.all
    @current_user = current_user
  end

  def show 
    @recipe = Recipe.find(params[:id])
  end

  def new 
    @recipe = Recipe.new
      3.times do 
        @recipe.ingredients.build 
      end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @author = Author.find_or_create_by(user_id: session[:user_id])
    @recipe.author = @author
      params[:recipe][:ingredients_attributes].each do |id, name|
        @recipe.ingredients << Ingredient.find_or_create_by(name: name[:name])
      end
    @recipe.save 
    redirect_to recipe_path(@recipe)
  end

private 

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image, :ingredients_array, :ingredient_ids =>[])
  end
=======
	def show
		binding.pry
		@recipe = Recipe.find(params[:id])
	end
>>>>>>> stub show page for recipe with bookmark button

end
