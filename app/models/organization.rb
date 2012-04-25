class Organization < ActiveRecord::Base
  belongs_to :head_organization
  has_many :teams
  has_many :users
end
