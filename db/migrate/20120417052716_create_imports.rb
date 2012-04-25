class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :user_id
      t.integer :team_id
      t.has_attached_file :spreadsheet
      t.timestamps
    end
  end
end
