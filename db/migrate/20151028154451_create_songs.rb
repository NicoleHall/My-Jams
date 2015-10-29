class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :title
      t.text :artist

      t.timestamps null: false
    end
  end
end
