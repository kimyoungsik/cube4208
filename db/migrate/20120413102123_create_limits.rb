class CreateLimits < ActiveRecord::Migration
  def change
    create_table :limits do |t|
      t.integer :team_id
      t.integer :item_id
      t.integer :amount

      t.timestamps
    end
  end
end
