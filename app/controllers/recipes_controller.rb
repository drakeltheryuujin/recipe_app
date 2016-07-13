class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show 
    @recipe = Recipe.find(params[:id])
  end

  def new 
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @author = Author.find_or_create_by(user_id: session[:user_id])
    @recipe.author = @author
    @recipe.save 
    redirect_to recipe_path(@recipe)
  end

private 

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image, :ingredient_ids =>[])
  end

end
