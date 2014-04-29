class Picture < ActiveRecord::Base
  validates :url, :description, :presence => true
end