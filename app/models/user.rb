class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  
  has_one :author
  has_one :reader
  has_one :shopping_list

  def filter_allergies
  	allergy_array = self.allergies.split(/[\s,']/).reject { |c| c.empty? }
  	@dangerous_food = []
  	allergy_array.select do |allergy|
  		@dangerous_food << Recipe.joins(:ingredients).where('ingredients.name != ?', '#{allergy}').to_a.flatten.uniq.first
  	end
  	@dangerous_food.uniq
  	@safe_food = Recipe.all.to_a - @dangerous_food
  end

  def hide_empty_fields
    self.attributes.select do |attribute, value|
      value != '' && attribute != 'password_digest' && attribute != 'created_at' && attribute != 'updated_at' && attribute != 'id' && attribute != 'image'
    end
  end

  def display_attribute_key(attribute)
    if attribute == 'bio'
      'About Me'
    elsif attribute == 'fav_cuisine'
      'Favorite Cuisine'
    else
      attribute.capitalize
    end
  end

  def display_image
    if self.image == ''
      '/none.png'
    else
      self.image
    end
  end

  def search_by_fav_cuisine
    faves = Recipe.all.search(self.fav_cuisine)
    faves[0..5]
  end

  def posted_recipes?
    !!self.author
  end

  def has_bookmarks?
    self.reader.bookmarks.any?
  end

  def wrote_reviews?
    self.reader.recipes.any?
  end

end
