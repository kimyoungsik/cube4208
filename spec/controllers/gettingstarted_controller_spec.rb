require 'spec_helper'

describe EntriesController do
  render_views
  
  before(:each) do
    Factory.create(:head_organization)
    Factory.create(:organization)
    @first_team = Factory.create(:team)
  end

  describe "access control" do  
    it "should deny access to 'update'" do
      post :update
      response.should redirect_to(user_session_url)
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = User.new(:email => "user3@headflow.net", :password => "dudtlr")
      @user.save
      sign_in @user
    end
    describe "success" do
      before(:each) do
        @attr = {:email => "user3@headflow.net", :password => "dudtlr", :team_id => @first_team, :first_name => "youngsik", :last_name => "kim"}
      end

      it "should change the user's attributes"#do
      #   put :update, :id => @user.id, :user => @attr
      #   @user.reload
      #   @user.first_name.should == @attr[:first_name]
      #   @user.last_name.should == @attr[:last_name]
      # end
      
      it "should redirect to the entry show page" do
        put :update, :id => @user.id, :user => @attr
        response.should redirect_to(gettingstarted_step2_path)
      end
    end
    
  end
end