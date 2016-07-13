class BookmarksController < ApplicationController

	def create
		binding.pry
		current_user.reader.bookmarks << Bookmark.create(bookmark_params)
	end

	private

	def bookmark_params
		params.require(:bookmark).permit(:recipe_id, :reader_id)
	end

end