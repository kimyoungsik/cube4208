#encoding:UTF-8
require 'spec_helper'

describe Import do
  
  before(:each) do
    Factory.create(:head_organization)
    Factory.create(:organization)
    @first_team = Factory.create(:team)
    @user = Factory(:user, :team => @first_team)
    @attr = { :team_id => @first_team.id, :spreadsheet => File.open(File.join(Rails.root, "public", "truebeans.xls")) }
  end  
  
  it "should create a new instance given valid attributes" do
     @user.imports.create!(@attr)
  end
  
  describe "user associations" do  
    before(:each) do
      @import = @user.imports.create!(@attr)
    end 
    it "should have a user attribute" do
      @import.should respond_to(:user)
    end 
    it "should have the right associated user"  do
      @import.user_id.should == @user.id
      @import.user.should == @user
    end  
  end
  
  describe "team association" do  
    before(:each) do
      @import = @user.imports.create!(@attr)
    end  
    it "should have a team attribute" do
      @import.should respond_to(:team)
    end 
    it "should have the right associated user"  do
      @import.team_id.should == @first_team.id
      @import.team.should == @first_team
    end
  end
  
  describe "validations" do  
    it "should require a user id" do   
      Import.new(@attr).should_not be_valid
    end
    it "should require nonblank amount" do
      @user.imports.build(@attr.merge(:spreadsheet=> nil)).should_not be_valid
    end
  end
end