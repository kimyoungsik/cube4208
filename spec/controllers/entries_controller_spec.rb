require 'spec_helper'

describe EntriesController do
  render_views
  
  before(:each) do
    Factory.create(:head_organization)
    Factory.create(:organization)
    @first_team = Factory.create(:team)
  end

  describe "GET 'index'" do
    describe "unsigned_in users" do   
      it "should deny access to 'index'" do
          get :index
          response.should redirect_to(user_session_url)
      end     
    end
    
    describe "for signed_in users" do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = Factory(:user, :team => @first_team)
        sign_in @user
        @team = @user.team  
        @entries = []
        5.times do |n|
          @entries << Factory(:entry, :user => @user, :team => @team,  :vendor => "#{n}vendor" )
        end
      end
      
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should have an payment_method in each entry" do
         get :index
         @entries[0..2].each do |entry|
             page.should have_selector('td',:text => 'cash')
         end
       end
    end
  end
  
  describe "POST 'create'" do
    
    describe "unsigned_in users" do   
      it "should deny access to 'create'" do
        post :create
        response.should redirect_to(user_session_url)
      end     
    end
    
    describe "for signed_in users" do
      describe "add each entry" do
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = Factory(:user, :team => @first_team)
          sign_in @user
          @team = @user.team
        end
        
        describe "success" do
          before(:each) do
            @attr = {:team_id => @team,:user_id => @user, :amount => 10000, :vendor => "right vendor"}
          end
          it "should create a entry" do
            lambda do
              post :create, :entry => @attr
            end.should change(Entry, :count).by(1)
          end
        end
        
        describe "failure" do
          before(:each) do
            @attr = {:team_id => @team,:user_id => @user, :vendor => "right vendor"}
          end
          it "should not create a entry" do
            lambda do
              post :create, :entry => @attr
            end.should_not change(Entry, :count)
          end
          it "should redirect to seed new page" do
            post :create, :entry => @attr
            response.should render_template('new')
          end
        end
      end
    end
  end
  
  
  describe "PUT 'update'" do  
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory(:user, :team => @first_team)
      sign_in @user
      @team = @user.team
      @entry = Factory(:entry, :user => @user, :team =>@team)
    end
    
    describe "unsigned_in users" do   
      before(:each) do
        sign_out @user
        @attr = { :user_id => @user, :team_id => @team, :amount => 10, :vendor => "change vendor", :summary => "right summary"}
      end

      it "should deny access to 'index'" do
        put :update, :id => @entry, :entry => @attr
        response.should redirect_to(user_session_url)
      end     
    end
    describe "signed_in users" do   
      describe "success" do
        before(:each) do
          @attr = { :user_id => @user, :team_id => @team, :amount => 10, :vendor => "change vendor", :summary => "right summary"}
        end
        it "should change the entry's attributes"do
          put :update, :id => @entry, :entry => @attr
          @entry.reload
          @entry.amount.should == @attr[:amount]
          @entry.vendor.should == @attr[:vendor]
        end
        it "should redirect to the entry show page" do
          put :update, :id => @entry, :entry => @attr
          response.should redirect_to(entry_path(@entry))
        end
      end
      describe "failure" do  
        before (:each) do
          @attr = { :user_id => "", :team_id => "", :vendor => "" }
        end   
        it "should render the 'edit' page"do 
          put :update, :id => @entry, :entry => @attr
          response.should render_template('edit')
        end
      end
    end    
  end
  
  describe "GET 'show'" do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory(:user, :team => @first_team)
      sign_in @user
      @team = @user.team
      @entry = Factory(:entry, :user => @user, :team =>@team)
    end
    
    it "should be successful" do
      get :show, :id => @entry
      response.should be_success
    end
    
    it "should find the right show" do
      get :show, :id => @entry
      assigns(:entry).should == @entry
    end
    # it "should have the right title" do
    #   get :show, :id => @entry
    #   response.should have_selector("p", :content => @entry.amount)
    # end    # 
    # it "should include the user's name" do
    #   get :show, :id => @entry
    #   page.has_content?("abcde")
    # end
  end
  
  describe "DELETE 'destroy'" do
    describe "unsigned_in users" do   
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = Factory(:user, :team => @first_team)
        sign_in @user
        @team = @user.team
        @entry = Factory(:entry, :user => @user, :team =>@team)
        sign_out @user
      end
      it "should deny access to 'index'" do
        delete :destroy, :id => @entry
        response.should redirect_to(user_session_url)
      end     
    end
    
    describe "for an unauthorized user" do 
      describe "another team user" do 
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = Factory(:user, :team => @first_team)
          @team = @user.team
          @anoterteam = Team.create!(:name => "truebeans", :organization_id => 1)
          wrong_user = Factory(:user, :email => Factory.next(:email), :team => @anoterteam)
          sign_in wrong_user
          @entry = Factory(:entry, :user => @user, :team =>@team)
        end    
        it "should deny access another team" do
          delete :destroy, :id => @entry
          response.should redirect_to(entries_path)
        end
        it "should not destroy the seed" do
          lambda do
            delete :destroy, :id => @entry
          end.should_not change(Entry, :count)        
        end
      end
        
      describe "another mentor" do
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = Factory(:user, :team => @first_team)
          sign_in @user
          @team = @user.team
          @entry = Factory(:entry, :user => @user, :team =>@team)
          sign_out @user

          @mentor = User.create!(
             :first_name => "kildong",
             :last_name => "hong",
             :organization_id => 2, 
             :status => "mentor-approved",
             :email  =>  "mentor2@headflow.net",
             :password => "dudtlr",
             :password_confirmation => "dudtlr")
          sign_in @mentor
        end
        it "should deny access another team" do
          delete :destroy, :id => @entry
          response.should redirect_to(entries_path)
        end
        it "should not destroy the seed" do
          lambda do
            delete :destroy, :id => @entry
          end.should_not change(Entry, :count)        
        end
      end
    end

    describe "for an authorized user" do
      describe "user" do
        before(:each) do
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = Factory(:user, :team => @first_team)
          sign_in @user
          @team = @user.team
          @entry = Factory(:entry, :user => @user, :team =>@team)
        end
        it "should destroy the entry" do
          lambda do
            delete :destroy, :id => @entry
          end.should change(Entry, :count).by(-1)
        end
      end
      describe "mentor" do
        before(:each) do
          
          @request.env["devise.mapping"] = Devise.mappings[:user]
          @user = Factory(:user, :team => @first_team)
          sign_in @user
          @team = @user.team
          @entry = Factory(:entry, :user => @user, :team =>@team)
          sign_out @user
          
          @mentor = User.create!(
            :first_name => "kildong",
            :last_name => "hong",
            :organization_id => 1, 
            :status => "mentor-approved",
            :email  =>  "mentor2@headflow.net",
            :password => "dudtlr",
            :password_confirmation => "dudtlr")
          sign_in @mentor
        
        end
        it "should destroy the entry" do
          lambda do
            delete :destroy, :id => @entry
          end.should change(Entry, :count).by(-1)
        end
      end  
    end
  end
end