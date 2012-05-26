class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :item_id
      t.integer :import_id
      t.integer :pay_method_id
      t.string :item_detail
      t.datetime :invoice_datetime
      t.integer :amount
      t.string :vendor
      t.string :branch
      t.string :payment_method
      t.string :summary
      t.string :status, :default => "pending"
      t.string :comment
      t.timestamps
    end
  end
end
