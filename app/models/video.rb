class Video < ActiveRecord::Base
  validates :url, :description, :presence => true
end
