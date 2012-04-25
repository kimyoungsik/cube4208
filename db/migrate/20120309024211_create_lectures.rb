class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :video_address

      t.timestamps
    end
  end
end
