class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :head_organization_id
      t.string :mailing_address
      t.string :facebook_page

      t.timestamps
    end
  end
end
