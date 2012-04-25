require 'spec_helper'

describe ImportsController do
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
        @imports = []
        5.times do |n|
          @imports << Factory(:import, :user => @user, :team => @team,  :spreadsheet_file_name => "#{n}file.xls" )
        end
      end
      
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      # it "should have an payment_method in each entry" do
      #         get :index
      #         @entries[0..2].each do |entry|
      #             page.has_content?('cash')
      #         end
      #       end
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
      
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = Factory(:user, :team => @first_team)
        sign_in @user
        @team = @user.team
      end
      
      describe "success" do
        before(:each) do
          @attr = {:team_id => @team, :user_id => @user, :spreadsheet => File.open(File.join(Rails.root, "public", "truebeans.xls")) }
        end
        it "should create a import" #do
          # lambda do
          #             post :create, :import => @attr
          #           end.should change(Import, :count).by(1)
          #         end
      end
      
      describe "failure" do
        before(:each) do
          @attr = {:team_id => @team,:user_id => @user, :spreadsheet =>""}
        end
        it "should not create a import" do
          lambda do
            post :create, :import => @attr
          end.should_not change(Import, :count)
        end
        it "should redirect to seed new page" do
          post :create, :import => @attr
          response.should render_template('new')
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
      @import = Factory(:import, :user => @user, :team =>@team)
    end
    
    it "should be successful" do
      get :show, :id => @import
      response.should be_success
    end
    
    it "should find the right show" do
      get :show, :id => @import
      assigns(:import).should == @import
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
        @import = Factory(:import, :user => @user, :team =>@team)
        sign_out @user
      end
      
      it "should deny access to 'index'" do
          delete :destroy, :id => @import
          response.should redirect_to(user_session_url)
        end     
    end
    
    describe "for an unauthorized user" do 
       before(:each) do
         @request.env["devise.mapping"] = Devise.mappings[:user]
         @user = Factory(:user, :team => @first_team)
         @team = @user.team
         wrong_user = Factory(:user, :email => Factory.next(:email), :team => @first_team)
         sign_in wrong_user
         @import = Factory(:import, :user => @user, :team =>@team)
       end    
       it "should deny access" #do
         # delete :destroy, :id => @entry
         #          response.should redirect_to(entries_path)
         #        end
       # it "should not destroy the seed" do
       #     lambda do
       #       delete :destroy, :id => @entry
       #     end.should_not change(Entry, :count)        
       #   end
     end

    describe "for an authorized user" do
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = Factory(:user, :team => @first_team)
        sign_in @user
        @team = @user.team
        @import = Factory(:import, :user => @user, :team =>@team)
      end
      it "should destroy the import" do
         lambda do
            delete :destroy, :id => @import
         end.should change(Import, :count).by(-1)
      end
    end
  end
  
end