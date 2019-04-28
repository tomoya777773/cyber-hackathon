class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :url
      t.string :title
      t.text :text
      t.float :score
      t.integer :category_id
      t.timestamps null: false
    end
  end
end 