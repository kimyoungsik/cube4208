class CreateWeekreports < ActiveRecord::Migration
  def change
    create_table :weekreports do |t|
      t.integer :user_id
      t.integer :team_id
      t.datetime :start
      t.datetime :end
      t.string :participants
      t.string :location
      t.string :goal
      t.text :contents
      t.text :result

      t.timestamps
    end
  end
end
