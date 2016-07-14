class Reader < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :recipes, through: :bookmarks

  def is_bookmarked?(recipe)
    self.recipes.include?(recipe)
  end
end
