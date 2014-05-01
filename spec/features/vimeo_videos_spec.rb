require_relative '../spec_helper'

feature "Managing Vimeo Videoes" do
  scenario "User sees Vimeo Videos on Vimeo Videos index page" do
    visit '/vimeo_videos'
    expect(body).to have_content 'Vimeo Videos'
  end

  scenario "User can add a Vimeo" do
    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/90199254'
    fill_in 'vimeo_video[description]', :with => 'This is a description of a video'
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'
    expect(page).to have_content 'http://vimeo.com/90199254'
    expect(page).to have_content 'Video Successfully Created'
  end

  scenario "User can view showpage of video from index page" do
    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/90199254'
    fill_in 'vimeo_video[description]', :with => 'This is a description of a video'
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'
    expect(page).to have_content 'http://vimeo.com/90199254'
    visit '/vimeo_videos'
    click_on 'http://vimeo.com/90199254'
    expect(page).to have_content 'This is a description of a video'
  end

  scenario "User cannot save a Blank URL or description" do
    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => ''
    fill_in 'vimeo_video[description]', :with => 'This is a description of a video'
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'
    expect(page).to have_content "Url can't be blank"

    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/90199254'
    fill_in 'vimeo_video[description]', :with => ''
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'
    expect(page).to have_content "Description can't be blank"
  end

  scenario "User can visit an edit page from the show page" do
    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/60399252'
    fill_in 'vimeo_video[description]', :with => 'This is a description of a video'
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'

    click_on 'Edit'

    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/90199254'
    fill_in 'vimeo_video[description]', :with => 'edit'
    fill_in 'vimeo_video[rating]', :with => '2'
    click_on 'Update'
    expect(page).to have_no_content 'This is a description of a video'
    expect(page).to have_no_content 'http://vimeo.com/60399252'
  end

  scenario "User can delete a vimeo video from the show page" do
    visit '/vimeo_videos'
    click_on 'New Video'
    expect(page).to have_content 'Add a Vimeo Video'
    fill_in 'vimeo_video[url]', :with => 'http://vimeo.com/90199254'
    fill_in 'vimeo_video[description]', :with => 'This is a description of a video'
    fill_in 'vimeo_video[rating]', :with => '1'
    click_on 'Create Video'

    click_on 'Delete'
    expect(page).to have_content 'Vimeo Videos'
    expect(page).to have_no_content 'http://vimeo.com/90199254'
  end
end
