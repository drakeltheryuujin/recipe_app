class RecipesController < ApplicationController


  def index
    @current_user = current_user
    if params[:search]
      @recipes = Recipe.search(params[:search]) + Recipe.search_by_ingredient(params[:search])
    else
      @recipes = Recipe.all
    end
  end

  def show 
    @recipe = Recipe.find(params[:id])
    @bookmark = Bookmark.new
    @line_item = LineItem.new
    @user = current_user  
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
        if name[:name] != "" 
          @recipe.ingredients << Ingredient.find_or_create_by(name: name[:name])
        end
      end
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

private 

  def recipe_params
    params.require(:recipe).permit(:title, :content, :image, :ingredients_array, :ingredient_ids =>[])
  end


end
