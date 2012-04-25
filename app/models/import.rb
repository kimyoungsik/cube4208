class Import < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  has_many :entries
  
  has_attached_file :spreadsheet
  
  validates_presence_of :user_id, :team_id
  validates_attachment_presence :spreadsheet
end
