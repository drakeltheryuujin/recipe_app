class CommentsController < ApplicationController

  def create
    current_user.reader.comments << Comment.create(comment_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :reader_id, :rating, :content)
  end

end
