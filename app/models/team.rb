class Team < ActiveRecord::Base
  has_many :users
  has_many :entries
  has_many :imports
  has_many :weekly_reports
      
  belongs_to :organization
  belongs_to :leader_user, :class_name => "User"
  
  attr_accessible :name, :facebook_page, :organization_id, :leader_user_id, :bank_branch, :account_number

  def mentor?(mentor)
    if mentor.mentor_approved? and self.organization == mentor.organization
      true
    else
      false
    end
  end
  
  def member?(user)
    if user.user_approved? and self == user.team
      true
    else
      false
    end
  end
  
  def leader?(user)
    if self.leader_user_id == user.id
      true
    else
      false
    end
  end
  
  def members_in_string
    members = self.users.map {|user| user.korean_full_name }
    members.join(", ")
  end
end
