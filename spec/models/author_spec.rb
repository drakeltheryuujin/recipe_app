require 'rails_helper'

RSpec.describe Author, type: :model do
	describe '#most_liked' do
		let(:author) { Author.create(user: User.create(name:'avi', password:'flatiron'))}
		let(:recipes) {FactoryGirl.create_list(:recipe, 3, author_id: author.id) }
		let(:bookmarks_1) {FactoryGirl.create_list(:bookmark, 2, recipe: recipes[0], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))}
		let(:bookmarks_2) {FactoryGirl.create_list(:bookmark, 3, recipe: recipes[1], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))}
		let(:bookmarks_3) {FactoryGirl.create_list(:bookmark, 1, recipe: recipes[2], reader: Reader.create(user: User.create(name:'tom', password:'jerry')))}
		it 'shows the most_liked for an author' do
			author.recipes = recipes
			byebug
			expect(author.most_liked).to eq(author.recipes.second)
		end
	# describe '#most_liked' do

	# 	let(:author) { Author.create(user: User.create(name: "foo", password: "bar")) }
	# 	let(:reader) { FactoryGirl.create :reader, user: User.create(name: "oof", password: "rab")}
	# 	let (:recipe) { FactoryGirl.create :recipe, author_id: user.author.id }
	# 	# let(:bookmark) { FactoryGirl.create :recipe, reader_id: user.author.id }

	# 	it 'test expectation' do
	# 		expect(user.)
		
	# 	let(:author) { Author.new}
	# 	let(:bookmark) {FactoryGirl.create}
	# end


					#3) 
		#need a User
		# a few recipes
		# lots of bookmarks (with reader.ids)

	end
end
