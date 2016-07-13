# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Reader.destroy_all
Author.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Bookmark.destroy_all

user = User.create(name: 'Tom', password: 'baseball')
user.reader = Reader.create(user_id: user.id)
user.author = Author.create(user_id: user.id)
recipe = Recipe.create(author_id: user.author.id, title: 'Chicken Pot Pie', content:'on nom nom...')
Ingredient.create(name: 'chicken breast')
Bookmark.create(reader_id: user.reader.id, recipe_id: recipe.id)

