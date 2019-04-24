class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :url
      t.string :title
      t.text :text
      t.float :score
      t.string :label
    end
  end
end
