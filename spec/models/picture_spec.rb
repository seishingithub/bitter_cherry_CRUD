require 'spec_helper'

describe Picture do
  describe 'validations' do
    before do
      @picture = Picture.new(:url => 'http://upload.wikimedia.org/wikipedia/commons/e/e2/Silky_bantam.jpg', :description => 'Oh Hai!', :rating => 3)
      expect(@picture).to be_valid
    end

    it 'ensures url cannot be blank' do
      @picture.url = ''
      expect(@picture).to_not be_valid
    end

    it 'ensures invalid url is invalid' do
      @picture.url = 'blah'
      expect(@picture).to_not be_valid
    end

    it 'ensures url cannot be blank' do
      @picture.description = ''
      expect(@picture).to_not be_valid
    end

    it 'ensures rating cannot be greater than 5' do
      @picture.rating = 6
      expect(@picture).to_not be_valid
    end

    it 'ensures rating cannot be less than 1' do
      @picture.rating = 0
      expect(@picture).to_not be_valid
    end

  end
end