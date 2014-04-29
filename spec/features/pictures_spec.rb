require_relative '../spec_helper'

feature "Manage Pictures" do
  scenario "User can add a new picture" do
    visit '/'
    click_on 'all pictures'
    click_on 'New Picture'
    expect(page).to have_content "Add a Picture"
    fill_in 'picture[url]', with: 'http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg'
    fill_in 'picture[description]', with: 'Life is short.

 here we go'
    fill_in 'picture[rating]', with: 5
    click_button 'Create Picture'
    expect(page).to have_content 'Picture successfully created'
    expect(page).to have_content 'Life is short.'
  end
end
