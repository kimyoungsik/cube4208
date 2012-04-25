class Team < ActiveRecord::Base
  has_many :users
  has_many :entries
  has_many :imports
  belongs_to :organization
  belongs_to :leader_user, :class_name => "User"
  
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

  
end
