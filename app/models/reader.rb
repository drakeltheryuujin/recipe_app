class Reader < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :reviews
  has_many :recipes, through: :bookmarks

  def is_bookmarked?(recipe)
    if self.recipes.empty?
      false
    else
      self.recipes.include?(recipe)
    end
  end

  def is_reviewed?(reviews)
    reviews.exists?(reader_id: self.id)
  end

end
