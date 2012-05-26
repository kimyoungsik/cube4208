class ChangeDateTypeForCommentLength < ActiveRecord::Migration
  def up
    change_column :entries, :comment, :text
  end

  def down
    change_column :entries, :comment, :string
  end
end
