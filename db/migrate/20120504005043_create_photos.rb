class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :entry_id
      t.string :image
      t.text :note
      t.timestamps
    end
  end
end
