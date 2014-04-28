require_relative '../spec_helper'

feature "Manage Pictures" do
  scenario "User sees 'Picture' on the /picture page" do
    visit '/'
    click_on 'all pictures'
    expect(page).to have_content 'Pictures'
  end
end