class ShoppingList < ApplicationRecord
	belongs_to :user
	has_many :line_items
  has_many :ingredients, through: :line_items

	def click_to_add(ingredient)
		self.line_items << LineItem.create(ingredient_id: ingredient.id,shopping_list_id: self.id)
	end

  def count_same_ingredients
    self.class.joins(:ingredients).group('ingredients.name').count('ingredients.name').sort.reverse
  end

	# def count_same_ingredient(target_ingredient)
	# 	ShoppingList.joins(line_items: :ingredient).count("ingredient.name").where("ingredient.name = #{target_ingredient.name}")	
	# end
end

# select * from shoppinglist joins line_items join  .... where lin