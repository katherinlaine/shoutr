class CreatePhotoShouts < ActiveRecord::Migration
  def change
    create_table :photo_shouts do |t|
      t.string :url, null: false

      t.timestamps
    end
  end
end
