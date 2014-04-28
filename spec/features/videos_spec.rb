require_relative '../spec_helper'

feature 'User can manage videos' do

  scenario 'user can click the all videos link' do
    visit '/'
    click_on 'all videos'
    expect(page).to have_content('Videos')
  end

end
