class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :facebook_page
      t.integer :organization_id
      t.integer :leader_user_id
      t.string :bank_branch
      t.string :account_number
      t.timestamps
    end
  end
end
