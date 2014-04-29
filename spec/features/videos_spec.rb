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

  scenario 'user can create a video' do
    url = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    expect(page).to have_content(url)
    expect(page).to have_content(desc)
    expect(page).to have_content(rating)
  end

  scenario 'user can view the show page and watch the video' do
    url = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    click_on 'all videos'
    click_on url
    expect(page).to have_content(desc)
  end

  scenario 'User sees error for a video without a URL' do
    url = ''
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    expect(page).to have_content(desc)
    expect(page).to have_content("Url can't be blank")

  end

end
