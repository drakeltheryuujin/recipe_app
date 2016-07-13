class Bookmark < ApplicationRecord
  belongs_to :reader
  belongs_to :recipe

  def show_bookmark
    # recipe_title
    # truncate_content
  end

  def recipe_title
    
  end

  def truncate_content

  end


end
