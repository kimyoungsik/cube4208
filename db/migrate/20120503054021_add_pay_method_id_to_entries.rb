class AddPayMethodIdToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :pay_method_id, :integer

  end
end
