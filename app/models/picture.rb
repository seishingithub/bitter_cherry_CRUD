class Picture < ActiveRecord::Base
  validates :url, :description, :presence => true

  validates :url, format: { with: /https?:\/\/\S*/i, message: 'must be a valid URL' }

  validates :rating, inclusion: { within: [1,2,3,4,5], message: "must be between 1 and 5"}

end
