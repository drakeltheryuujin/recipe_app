class ShoppingList < ApplicationRecord
	belongs_to :user
	has_many :line_items

	def click_to_add(ingredient)
		self.line_items << LineItem.create(ingredient_id: ingredient.id,shopping_list_id: self.id)
	end
end
