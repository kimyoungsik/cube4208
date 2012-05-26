class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :business_trip_report_id
      t.string :classification
      t.datetime :date
      t.integer :amount
      t.integer :pay_method_id
      t.string :note
      t.timestamps
    end
  end
end
