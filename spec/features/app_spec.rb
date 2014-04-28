require_relative '../spec_helper'

feature "Manage Media" do
  scenario "User sees Media Manager onthe home screen" do
    visit '/'
    expect(page).to have_content 'Media Manager'
    expect(page).to have_content 'all pictures'
    expect(page).to have_content 'all videos'
    expect(page).to have_content 'Not copyrighted at all'
  end
end