class Video < ActiveRecord::Base
  validates :url, :description, :presence => true

  validates :url, format: { with: /(http|https):\/\/www.youtube.com\/watch\?v=\w*/i, message: 'must be a valid YouTube url' }
end