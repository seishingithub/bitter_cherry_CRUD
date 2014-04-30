class Picture < ActiveRecord::Base
  validates :url, :description, :presence => true

  validates :url, format: { with: /https?:\/\/\S*/i, message: 'must be a valid URL' }
end