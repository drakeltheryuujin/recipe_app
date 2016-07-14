class Author < ApplicationRecord
	belongs_to :user
	has_many :recipes
	
	def most_liked
		Recipe.where(author_id: self.id).joins(:bookmarks).group('recipes.title').order('count(*) desc limit 1').count('recipes.title')
  	end

  	def who_bookmarked

  	end
end
