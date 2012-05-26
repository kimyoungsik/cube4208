class Expense < ActiveRecord::Base
  belongs_to :business_trip_report
  belongs_to :pay_method
  
  validates :classification, :presence => true
  validates :date, :presence => true
  validates :pay_method_id, :presence => true
  
  
end
