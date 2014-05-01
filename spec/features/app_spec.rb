require_relative '../spec_helper'

feature "Manage Media" do
  scenario "User sees Media Manager onthe home screen" do
    visit '/'
    expect(page).to have_content 'Media Manager'
    expect(page).to have_content 'all pictures'
    expect(page).to have_content 'all videos'
    expect(page).to have_content 'vimeo videos'
    expect(page).to have_content 'Not copyrighted at all'
  end
  scenario "User can got to show pages from home page" do
    visit '/'
    within('div#picture_control') do
      click_link 'View All'
    end
    expect(page).to have_content 'New Picture'

    visit '/'
    within('div#video_control') do
      click_link 'View All'
    end

    expect(page).to have_content 'New Video'

    visit '/'
    within('div#vimeo_control') do
      click_link 'View All'
    end

  expect(page).to have_content 'New Video'

  end

  scenario "User can go to new media pages from home page" do
    visit '/'
    within('div#picture_control') do
      click_link 'Add New'
    end
    expect(page).to have_content 'Add a Picture'

    visit '/'
    within('div#video_control') do
      click_link 'Add New'
    end

    expect(page).to have_content 'Add a Video'

    visit '/'
    within('div#vimeo_control') do
      click_link 'Add New'
    end

    expect(page).to have_content 'Add a video'

  end
end