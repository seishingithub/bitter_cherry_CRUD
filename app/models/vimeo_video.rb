class VimeoVideo < ActiveRecord::Base
  validates :url, :description, :rating, :presence => true
end