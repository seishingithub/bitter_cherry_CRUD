class VimeoVideo < ActiveRecord::Base
  validates :url, :description, :rating, :presence => true

  validates :url,
            format: {
              with: /(http|https):\/\/vimeo.com\/\d*/,
              message: "must be a proper Vimeo Video url"
            }

  validates :rating, inclusion: { within: [1,2,3,4,5], message: "must be between 1 and 5"}

end
