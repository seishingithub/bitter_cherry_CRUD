class VimeoVideo < ActiveRecord::Base
  validates :url, :description, :rating, :presence => true
  validates :url, format: { with: /(http|https):\/\/vimeo.com\/\d*/, message: 'must be a valid vimeo url' }

end