class Recipe < ApplicationRecord

  #validates :title, presence: true
  belongs_to :author
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :bookmarks
  has_many :readers, through: :bookmarks
  accepts_nested_attributes_for :ingredients

  def title=(title)
    write_attribute(:title, title.downcase)
  end

  def title
    read_attribute(:title).split.map do |word|
      word.capitalize
    end.join(" ")
  end

  def self.most_bookmarked(num)
    top_bookmark_hash = Bookmark.group('recipe_id').order("count(*) desc limit #{num}").count('recipe_id')

    top_recipes = top_bookmark_hash.keys.map {|key| self.find(key).title }
    top_recipes_count = top_bookmark_hash.values

    top_recipes.zip(top_recipes_count).compact

  end 


  def self.most_recent(num)
    order("created_at desc limit #{num}").to_a
  end

  def self.top_ingredients
    RecipeIngredient.group('ingredient_id').order('count(*) desc limit 1').count('ingredient_id')
    # {1=>9}
    # 1 (cucumber) is the most used ingredient. 9 is the count. 
  end

  def self.search_by_ingredient(ingredient)
    Recipe.joins(:ingredients).where("ingredients.name = '#{ingredient}'")
  end

  def self.search(cuisine)
    Recipe.where("title like ?", "%#{cuisine}%")
  end


  def who_bookmarked
    recipe.bookmarks.map do |bookmark|
      Reader.find(bookmark.reader_id).user
    end
  end

end
