class AddPurposeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :purpose, :string

  end
end
