require_relative '../spec_helper'

feature "Manage Media" do
  scenario "User sees Media Manager onthe home screen" do
    visit '/'
    expect(page).to have_content 'Media Manager'
  end
end