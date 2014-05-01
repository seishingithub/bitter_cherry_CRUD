require 'spec_helper'

describe Video do
  describe 'validations' do
    before do
      @video = Video.new(:url => 'http://www.youtube.com/watch?v=QvxdDDHElZo', :description => 'Oh Hai!')
      expect(@video).to be_valid
    end

    it 'ensures url cannot be blank' do
      @video.url = ''
      expect(@video).to_not be_valid
    end

    it 'ensures invalid YouTube url is invalid' do
      @video.url = 'blah'
      expect(@video).to_not be_valid
    end

    it 'ensures url cannot be blank' do
      @video.description = ''
      expect(@video).to_not be_valid
    end
  end
end