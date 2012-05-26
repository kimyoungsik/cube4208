class Entry < ActiveRecord::Base
  
  
  belongs_to :team
  belongs_to :user
  belongs_to :import
  belongs_to :item
  belongs_to :pay_method
  
  has_many :photos
  has_many :business_trip_reports
  has_many :meetings
  accepts_nested_attributes_for :photos, allow_destroy: true
  accepts_nested_attributes_for :business_trip_reports, allow_destroy: true
  accepts_nested_attributes_for :meetings, allow_destroy: true
  validates_uniqueness_of :team_id, :scope => [:vendor, :invoice_datetime]
  
  validates :user_id, :presence => true
  validates :amount, :presence => true
  
  default_scope :order => 'entries.invoice_datetime DESC'
end

