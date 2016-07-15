class ReviewsController < ApplicationController

  def create
    current_user.reader.reviews << Review.create(review_params)
    recipe_id = review_params[:recipe_id]
    redirect_to recipe_path(recipe_id)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :reader_id, :rating, :content)
  end

end
