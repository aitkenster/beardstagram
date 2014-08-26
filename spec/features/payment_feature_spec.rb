require 'rails_helper'

describe 'payments' do 
	context 'when a share is being created' do 
		it 'a user can add a price' do 
			visit '/shares'
			click_link 'New Share'
			fill_in 'Title', with: 'Baby Beard'
			fill_in	'Purchase Price', with: 20.00
			attach_file 'Picture', Rails.root.join('spec/images/baby_beard.jpeg')
			click_button 'Create share'
			expect(page).to have_content '£20.00'
		end
	end
end