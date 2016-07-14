class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  
  has_one :author
  has_one :reader

  def filter_allergies
  	allergy_array = self.allergies.split(/[\s,']/).reject { |c| c.empty? }
  	@dangerous_food = []
  	allergy_array.select do |allergy|
  		@dangerous_food << Recipe.joins(:ingredients).where('ingredients.name != ?', '#{allergy}').to_a.flatten.uniq.first
  	end
  	@dangerous_food.uniq
  	@safe_food = Recipe.all.to_a - @dangerous_food
  end




end
