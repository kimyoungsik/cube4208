class UsersController < ApplicationController
  respond_to :html, :json
  def index
    @users = User.find_all_by_status("user-approved")
    @mentors = User.find_all_by_status("mentor-approved")
    @pending_mentors = User.find_all_by_status_and_team_id("pending",nil)
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(params[:user])
      respond_with @user
    else
      redirect_to root_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
end
