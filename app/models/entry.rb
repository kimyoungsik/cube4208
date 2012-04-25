class Entry < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :import
  belongs_to :item
  
  validates_uniqueness_of :team_id, :scope => [:amount, :vendor, :invoice_datetime]
  
  validates :user_id, :presence => true
  validates :amount, :presence => true
end

