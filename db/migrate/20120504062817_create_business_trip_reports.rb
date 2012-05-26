class CreateBusinessTripReports < ActiveRecord::Migration
  def change
    create_table :business_trip_reports do |t|
      t.integer :entry_id
      t.string :participants
      t.datetime :start
      t.datetime :end
      t.string :perpose
      t.string :location
      t.string :interviewee
      t.text :content
      t.text :result
      t.text :note
      t.timestamps
    end
  end
end
