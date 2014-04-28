require_relative '../spec_helper'

feature "Manage Pictures" do
  scenario "User can add a new picture" do
    visit '/'
    click_on 'all pictures'
    click_on 'New Picture'
    expect(page).to have_content "Add a Picture"
    fill_in 'Url', with: 'http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg'
    fill_in 'Description', with: 'Life is short.'
    fill_in 'Rating', with: 5
  end
end