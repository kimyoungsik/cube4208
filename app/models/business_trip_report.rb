class BusinessTripReport < ActiveRecord::Base
  belongs_to :entry
  
  has_many :expenses
  accepts_nested_attributes_for :expenses, allow_destroy: true
end
