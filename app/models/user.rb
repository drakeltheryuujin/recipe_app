class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  
  has_one :author
  has_one :reader

  # def test
  # 	self.author.recipes.first
  # end

 


end
