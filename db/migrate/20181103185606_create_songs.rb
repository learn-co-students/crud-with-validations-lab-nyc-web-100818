class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string   :title #must not be blank cant have save artist and year
      t.boolean  :released
      t.integer  :release_year #optional if released is false, not blank if released is true
      t.string   :artist_name #must not be blank
      t.string   :genre #must not be blank
      t.timestamps null: false
    end
  end
end
