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
  scenario "User sees error when adding a picture without a URL" do
    click_on 'all pictures'
    click_on 'New Picture'
    fill_in 'picture[url]', with: ''
    fill_in 'picture[description]', with: ''
    fill_in 'picture[rating]', with: 5
    click_button 'Create Picture'
    expect(page).to have_content "Url can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
  scenario "User can edit a picture" do
    click_on 'all pictures'
    src = "http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg"
    find(:xpath, "//a/img[@src='#{src}']/..").click
    click_link 'Edit'
    fill_in 'picture[description]', with: 'This is an edited description'
    click_button 'Update Picture'
    expect(page).to have_content "This is an edited description"
  end

  scenario "User can delete a picture" do
    src = "http://listdose.com/wp-content/uploads/2013/07/coffee-ending.jpg"
    click_on 'all pictures'
    expect(page).to have_selector(:xpath, "//a/img[@src='#{src}']/..")
    find(:xpath, "//a/img[@src='#{src}']/..").click
    click_button 'Delete Picture'
    expect(page).to_not have_selector(:xpath, "//a/img[@src='#{src}']/..")
    expect(page).to have_content "Picture successfully deleted"
  end
end