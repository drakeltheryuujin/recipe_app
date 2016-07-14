require 'rails_helper'

RSpec.describe User, type: :model do
	describe '#test' do

		let(:user) { User.create(name: "Avi", password: "flatiron")}
		let(:author) { Author.create(user_id: user.id) }
		let (:recipe) { FactoryGirl.create :recipe, author_id: author.id }

		it 'test expectation' do
			user.author = author
			author.recipes << recipe 
			expect(user.test).to eq(recipe) 
		end					#3) 
		#need a User
		# a few recipes
		# lots of bookmarks (with reader.ids
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
