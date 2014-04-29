require_relative '../spec_helper'

feature "Manage Pictures" do
  before do
    visit '/'
    click_on 'all pictures'
    click_on 'New Picture'
    expect(page).to have_content "Add a Picture"
    fill_in 'picture[url]', with: 'http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg'
    fill_in 'picture[description]', with: 'Life is short.

 here we go'
    fill_in 'picture[rating]', with: 5
    click_button 'Create Picture'
  end

  scenario "User can add a new picture" do
    expect(page).to have_content 'Picture successfully created'
    expect(page).to have_content 'Life is short.

 here we go'
  end

  scenario "User can see thumbnails of all the pictures" do
    click_on 'all pictures'
    expect(page).to have_content 'Pictures'
    src = 'http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg'
    find(:xpath, "//a/img[@src='#{src}']/..").click
    expect(page).to have_content("Life is short")
  end
end
