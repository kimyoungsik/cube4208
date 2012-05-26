class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.integer :entry_id
      t.string :participants
      t.datetime :start
      t.datetime :end
      t.string :perpose
      t.string :location
      t.text :content

      t.timestamps
    end
  end
end
