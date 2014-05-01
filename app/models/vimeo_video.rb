class VimeoVideo < ActiveRecord::Base
  validates :url, :description, :rating, :presence => true

  validates :url,
            format: {
              with: /(http|https):\/\/vimeo.com\/\d{8}(?=\b|\/)/,
              message: "must be a proper Vimeo Video url"
            }
end
