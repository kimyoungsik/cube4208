class AddHeadOrganzationIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :head_organization_id, :integer
  end
end
