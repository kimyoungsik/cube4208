class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  before_filter :unapproved_user, :except => [:destroy]
  # before_filter :user_access_denied
  protect_from_forgery
  
  def unapproved_user
    if user_signed_in? and !(current_user.user_approved? or current_user.mentor_approved?)
      redirect_to gettingstarted_step2_path
    end
  end
  
  def user_access_denied
    if user_signed_in? and current_user.user_approved?
      redirect_to root_path
    end
  end
end
