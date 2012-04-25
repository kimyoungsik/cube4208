class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :birthday, :gender, :facebook_uid, :facebook_token, :team_id, :status, :organization_id, :head_organization_id
  
  has_many :entries
  has_many :imports
  belongs_to :team # team users only
  belongs_to :organization # mentors only
  belongs_to :head_organization # heads only
  
  validates_inclusion_of :status, :in => ["pending", "user-approved","mentor-approved","head-approved"]
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, 
                    :first_name => data.first_name, 
                    :last_name => data.last_name, 
                    :birthday => Date::strptime(data.birthday, "%m/%d/%Y"),
                    :gender => data.gender,
                    :facebook_uid => data.id,
                    :facebook_token => access_token.credentials.token,
                    :password => Devise.friendly_token[0,20]) 
    end
  end
  
  def full_name
    first_name + " " + last_name
  end
  
  def korean_full_name
    last_name + first_name
  end

  def facebook_profile_photo
    "http://graph.facebook.com/#{self.facebook_uid}/picture?type=square"
  end
  
  def user_approved?
    if self.status == "user-approved"
      true
    else
      false
    end
  end

  def mentor_approved?
    if self.status == "mentor-approved"
      true
    else
      false
    end
  end
  
  def head_approved?
    if self.status == "head-approved"
      true
    else
      false
    end
  end
end
