class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  
  has_one :author
  has_one :reader

  # def test
  # 	self.author.recipes.first
  # end

 


  def search_by_fav_cuisine
    faves = Recipe.all.search(self.fav_cuisine)
    faves[0..5]
  end

end
