class CreateHeadOrganizations < ActiveRecord::Migration
  def change
    create_table :head_organizations do |t|
      t.string :name
      t.string :facebook_page

      t.timestamps
    end
  end
end
