class Recipe < ApplicationRecord
	belongs_to :author
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	has_many :bookmarks	
	has_many :readers, through: :bookmarks

  # def ingredient_ids=(ingredient_ids) 
  #   byebug
  #   ingredient_ids.each do |ingredient_id|
  #     self.ingredients.build(Ingredients.find(ingredient_id))
  #   end
  # end

end
