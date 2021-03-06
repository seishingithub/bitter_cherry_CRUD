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
    expect(page).to have_field('Short Description', with: desc)
    expect(page).to have_content("Url can't be blank")

  end

  scenario 'Users see an error when they try to create a video without a description' do
    url = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc = ''
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    expect(page).to have_field('URL of Video', with: url)
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'User sees a list of all added videos' do
    url_1 = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc_1 = 'broke my heart!'
    rating = '5'
    url_2 = 'http://www.youtube.com/watch?v=QvxdDDHElZo'
    desc_2 = 'oh hai'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url_1
    fill_in 'Description', with: desc_1
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url_2
    fill_in 'Description', with: desc_2
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    click_on 'all videos'
    expect(page).to have_content(url_1)
    expect(page).to have_content(url_2)
  end

  scenario 'User can see an edit form for a video' do
    url = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    desc_update = "That hurts"
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    click_on 'Edit'
    fill_in 'Description', with: desc_update
    click_on 'Update Video'
    expect(page).to have_content(desc_update)
  end

  scenario 'User sees error messages for blank fields during edit' do
    url = 'http://www.youtube.com/watch?v=4lCotjd3pR8'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    url_update = ''
    desc_update = ''
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    click_on 'Edit'
    fill_in 'URL', with: url_update
    fill_in 'Description', with: desc_update
    click_on 'Update Video'
    expect(page).to have_content("Url can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'User can delete a video' do
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
    click_on 'Delete Video'
    expect(page).to_not have_content(url)
    expect(page).to have_content('Video successfully Deleted')
    expect(current_path).to eq(videos_path)
  end

  scenario 'Invalid Youtube url results in error message' do
    url = 'http://www.google.com'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    rating = '5'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    expect(page).to have_content('Url must be a valid YouTube url')
  end

  scenario 'Invalid rating results in error message' do
    url = 'http://www.google.com'
    desc = 'Soccer Ball (In The Face) - Parry Gripp'
    rating = '6'
    visit '/'
    click_on 'all videos'
    click_on 'New Video'
    fill_in 'URL', with: url
    fill_in 'Description', with: desc
    fill_in 'Rating', with: rating
    click_on 'Create Video'
    expect(page).to have_content("Rating must be between 1 and 5")
  end

end
