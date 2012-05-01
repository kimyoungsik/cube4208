class GettingstartedController < ApplicationController
  skip_before_filter :unapproved_user
  before_filter :approved_user
  def step1
  end
  
  def step2
    if (current_user.team_id.nil? and current_user.organization_id.nil? and current_user.head_organization_id.nil?)  or current_user.first_name.blank? or current_user.first_name.blank? 
      redirect_to gettingstarted_step1_path
    end
  end
  
  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to gettingstarted_step2_path
    else
      render "step1"
    end
  end
  
  def approved_user
    if current_user.user_approved? or current_user.mentor_approved? or current_user.head_approved?
      redirect_to root_path
    end
  end
end
