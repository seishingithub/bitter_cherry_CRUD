class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :url, null: false
      t.string :description
      t.integer :rating

      t.timestamps
    end
  end
end
