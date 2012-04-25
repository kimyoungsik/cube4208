#encoding:UTF-8
require 'spec_helper'

describe Entry do
  
  before(:each) do
    Factory.create(:head_organization)
    Factory.create(:organization)
    @first_team = Factory.create(:team)
    @user = Factory(:user, :team => @first_team)
    @attr = {:team_id => @first_team.id, :amount => 10000, :vendor => "right vendor", :summary => "right summary" } 
  end
  
  it "should create a new instance given valid attributes" do
     @user.entries.create!(@attr)
  end
  
  describe "user associations" do  
    before(:each) do
      @entry = @user.entries.create!(@attr)
    end 
    it "should have a user attribute" do
       @entry.should respond_to(:user)
    end 
    it "should have the right associated user"  do
      @entry.user_id.should == @user.id
      @entry.user.should == @user
    end  
  end
  
  describe "team association" do  
    before(:each) do
      @entry = @user.entries.create!(@attr)
    end  
    it "should have a team attribute" do
      @entry.should respond_to(:team)
    end 
    it "should have the right associated team"  do
      @entry.team_id.should == @first_team.id
      @entry.team.should == @first_team
    end
  end
  
  describe "validations" do  
    it "should require a user id" do   
      Entry.new(@attr).should_not be_valid
    end
    it "should require nonblank amount" do
      @user.entries.build(@attr.merge(:amount=> nil)).should_not be_valid
    end
    
    it "should require nonblank invoice_datetime"
    
    
    # it "should reject long title (max: 140 characters)" do
    #   @user.seeds.build(@attr.merge(:team_id=> nil)).should_not be_valid
    # end
    # it "should require nonblank description" do
    #   @user.seeds.build(@attr.merge(:description => "  ")).should_not be_valid
    # end  
    # it "should reject long description (max: 10000 characters)" do
    #   @user.seeds.build(@attr.merge(:description => "t" * 10001)).should_not be_valid
    # end 
  end
end