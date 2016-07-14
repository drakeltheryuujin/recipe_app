class Author < ApplicationRecord
	belongs_to :user
	has_many :recipes
	
	def most_liked
		recipes.maximum(bookmarks.count)
		byebug
  	end
end
