require_relative '../spec_helper'

feature 'User can manage videos' do

  scenario 'user can click the all videos link' do
    visit '/'
    click_on 'all videos'
    expect(page).to have_content('Videos')
  end

  scenario 'user should be able to see a new video form' do
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    expect(page).to have_content('URL')
    expect(page).to have_content('Description')
    expect(page).to have_content('Rating')
  end

end
