class CreateVimeoVideos < ActiveRecord::Migration
  def change
    create_table :vimeo_videos do |t|
      t.string :url
      t.string :description
      t.integer :rating
    end
  end
end
