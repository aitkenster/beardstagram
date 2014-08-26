require 'rails_helper'

describe 'shares' do 
	
	context 'no shares' do

		it 'shows a message' do
			visit '/shares'
			expect(page).to have_content 'No shares'
		end
		
	end

	context 'has a shares' do 
		before do
			Share.create(title: "Dis ma beard")
		end
		it 'shows a list of all shared beards' do
			visit '/shares'
			expect(page).to have_content "Dis ma beard"
		end
	end

	context 'creating a share' do

		before(:each) do 
			user = User.create(email: 'a@a.com', password: '12345678', password_confirmation: '12345678')
			login_as(user, scope: :user) 
		end

		it 'adds the beard from a form' do
			visit '/shares'
			click_link 'New Share'
			fill_in 'Title' , with: 'A brand new beard'
			click_button 'Create share'

			expect(page).to have_content 'A brand new beard'
			expect(current_path).to eq '/shares'
		end
		it 'adds a picture to the share' do 
			visit '/shares'
			click_link 'New Share'
			fill_in 'Title', with: 'Baby Beard'
			attach_file 'Picture', Rails.root.join('spec/images/baby_beard.jpeg')
			click_button 'Create share'
			expect(page).to have_css 'img.uploaded-pic'
		end

	end

end