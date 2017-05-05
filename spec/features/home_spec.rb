require 'rails_helper'

describe 'Home page testing' do

    before(:each) do
    	
      Category.delete_all
      Category.create([{ name: 'Indian' }, { name: 'Chinese' }, { name: 'Desserts' }, { name: 'Starters' }, { name: 'Appetizers' }, { name: 'Cakes' }])
    end

    it 'User successfully lands to Home page without login' do
      visit root_path
      expect(page).to have_text 'Choose from a category of your choice'
    end

    it 'User prompted for login on clicking on any of the categories' do
      visit root_path
      click_link "Indian"
      expect(page).to have_text 'Log in'
    end
    
end