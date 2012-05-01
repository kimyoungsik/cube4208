class CreateWeeklyReports < ActiveRecord::Migration
  def change
    create_table :weekly_reports do |t|
      t.integer :user_id
      t.integer :team_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :participants
      t.string :location
      t.string :purpose
      t.text :content
      t.text :result

      t.timestamps
    end
  end
end
