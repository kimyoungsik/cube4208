class ChangeStringFormatInEntries < ActiveRecord::Migration
  def up
    change_column :entries, :summary, :text
  end

  def down
    change_column :entries, :summary, :string
  end
end
