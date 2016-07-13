class Bookmark < ApplicationRecord
  belongs_to :reader
  belongs_to :recipe

<<<<<<< HEAD
  def show_recipe
    Recipe.find(self.recipe_id)
  end

  def recipe_title
    self.show_recipe.title
  end

  def truncate_content
    self.show_recipe.content[0, 47] + "..."
  end


=======
  def show_bookmark
    # recipe_title
    # truncate_content
  end

  def recipe_title
    
  end

  def truncate_content

  end
>>>>>>> c09cab2008b021577e421bf3eb25afd6cedf31a1


end
