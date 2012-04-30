require 'spec_helper'

describe "weekreports/edit" do
  before(:each) do
    @weekreport = assign(:weekreport, stub_model(Weekreport,
      :team_id => 1,
      :participants => "MyString",
      :location => "MyString",
      :goal => "MyString",
      :contents => "MyText",
      :result => "MyString"
    ))
  end

  it "renders the edit weekreport form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => weekreports_path(@weekreport), :method => "post" do
      assert_select "input#weekreport_team_id", :name => "weekreport[team_id]"
      assert_select "input#weekreport_participants", :name => "weekreport[participants]"
      assert_select "input#weekreport_location", :name => "weekreport[location]"
      assert_select "input#weekreport_goal", :name => "weekreport[goal]"
      assert_select "textarea#weekreport_contents", :name => "weekreport[contents]"
      assert_select "input#weekreport_result", :name => "weekreport[result]"
    end
  end
end
